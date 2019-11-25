defmodule EdifactParser.Component do
  @qualifiers_definitions "priv/D96A/qualifiers.json"
                          |> File.read!()
                          |> Jason.decode!()

  def qualifier_definitions, do: @qualifiers_definitions

  def parse(%{} = state, comp_tokens, comp_defs) do
    case parse({state, []}, comp_tokens, comp_defs) do
      {:ok, {_, components}} -> {:ok, Enum.into(components, %{})}
      {:error, _} = err -> err
      err -> {:error, err}
    end
  end

  def parse({state, components}, [comp_token | comp_tokens], [comp_def | comp_defs]) do
    case parse_one(state, comp_token, comp_def) do
      {:ok, component} -> parse({state, [component | components]}, comp_tokens, comp_defs)
      {:error, _} = err -> err
      err -> {:error, err}
    end
  end

  def parse(_state, [], [%{"Id" => id, "Required" => true} | _]) do
    {:error, "Missing required component #{id}"}
  end

  def parse(_state, [_ | _] = comp_tokens, []) do
    {:error, "Unrecognized components: #{Enum.join(comp_tokens, ", ")}"}
  end

  def parse(state, [], _) do
    {:ok, state}
  end

  def parse_one(_state, c, %{"Id" => id, "Desc" => desc, "QualifierRef" => type}) do
    qualifier_desc =
      qualifier_definitions()
      |> Map.get(type, %{})
      |> Map.get(c, "")

    {:ok, {id, %{"val" => c, "desc" => desc, "qualifier_desc" => qualifier_desc}}}
  end

  def parse_one(%{charset: charset}, c, %{"Id" => id, "Desc" => desc}) do
    {:ok, {id, %{"val" => Codepagex.to_string!(c, charset), "desc" => desc}}}
  end
end

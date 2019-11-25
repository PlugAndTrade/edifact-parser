defmodule EdifactParser.Component do
  @qualifiers_definitions "priv/D96A/qualifiers.json"
                          |> File.read!()
                          |> Jason.decode!()

  def qualifier_definitions, do: @qualifiers_definitions

  def parse(state, [c | components], [cd | component_defs]) do
    case parse(state, components, component_defs) do
      {:ok, parsed_components} ->
        case parse_one(state, c, cd) do
          {:ok, {cid, cval}} -> {:ok, Map.put(parsed_components, cid, cval)}
          err -> err
        end

      err ->
        err
    end
  end

  def parse(_, _, _) do
    {:ok, %{}}
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

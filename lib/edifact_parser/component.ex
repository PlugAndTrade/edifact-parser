defmodule EdifactParser.Component do
  @moduledoc """
  Component definition properties
   * DataType
   * Desc
   * Id
   * MaxLength
   * MinLength
   * QualifierRef
   * Required
  """

  @qualifiers_definitions "priv/D96A/qualifiers.json"
                          |> File.read!()
                          |> Jason.decode!()

  def qualifier_definitions, do: @qualifiers_definitions

  def parse(%{} = state, comp_tokens, comp_defs) do
    case parse({state, []}, comp_tokens, comp_defs) do
      {:ok, {components, []}} ->
        {:ok, Enum.into(components, %{})}
      {:ok, {_, rest}} ->
        {:error, "Unrecognized components: #{Enum.join(rest, ", ")}"}
      err ->
        {:error, err}
    end
  end

  def parse({state, components}, tokens, [%{"Group" => [%{"Id" => id} | _] = inner_defs, "Count" => count} | comp_defs]) do
    {group_results, rest} = Enum.reduce(1..count, {[], tokens}, fn _, {groups, tokens} ->
      case parse({state, []}, tokens, inner_defs) do
        {:ok, {group, rest}} -> {[{:ok, Enum.into(group, %{})} | groups], rest}
        {:error, _} = err -> {[err | groups], tokens}
      end
    end)

    case group_results |> Utils.reduce_result() do
      {:ok, groups} -> parse({state, [{id, Enum.reverse(groups)} | components]}, rest, comp_defs)
      {:error, _} = err -> err
    end
  end

  def parse({state, components}, tokens, [%{"Count" => count} = comp_def | comp_defs]) do
    {repeated_tokens, remaining_tokens} = Enum.split(tokens, count)
    result = repeated_tokens |> Enum.map(&parse_one(state, &1, comp_def)) |> Utils.reduce_result()

    case result do
      {:ok, repeated_components} ->
        component =
          repeated_components |> Enum.reduce({"", []}, fn {k, v}, {_, vs} -> {k, vs ++ [v]} end)

        parse({state, [component | components]}, remaining_tokens, comp_defs)

      {:error, _} = err ->
        err
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

  def parse({_state, components}, rest, _) do
    {:ok, {components, rest}}
  end

  def parse_one(_state, "", %{"Id" => id, "Desc" => desc, "Required" => false}) do
    {:ok, {id, %{"val" => "", "desc" => desc}}}
  end

  def parse_one(_state, "", %{"Id" => id, "Desc" => desc, "minLength" => 0}) do
    {:ok, {id, %{"val" => "", "desc" => desc}}}
  end

  def parse_one(_state, c, %{"Id" => id, "Desc" => desc, "QualifierRef" => type}) do
    case qualifier_definitions() |> Map.get(type, %{}) |> Map.fetch(c) do
      {:ok, val} ->
        {:ok, {id, %{"val" => c, "desc" => desc, "qualifier_desc" => val}}}

      :error ->
        {:error, "Value '#{c}' of type '#{type}' for component '#{id}' not found"}
    end
  end

  def parse_one(%{charset: charset}, c, %{"Id" => id, "Desc" => desc}) do
    {:ok, {id, %{"val" => Codepagex.to_string!(c, charset), "desc" => desc}}}
  end
end

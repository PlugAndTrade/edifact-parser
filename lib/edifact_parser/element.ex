defmodule EdifactParser.Element do
  @moduledoc """
  Element definition properties
   * Components
   * Count
   * DataType
   * Desc
   * Id
   * MaxLength
   * MinLength
   * QualifierRef
   * Repeat
   * Required
  """

  def parse(%{} = state, element_tokens, element_defs) do
    case parse({state, []}, element_tokens, element_defs) do
      {:ok, {_, elements}} -> {:ok, Enum.into(elements, %{})}
      {:error, _} = err -> err
      err -> {:error, err}
    end
  end

  def parse({state, elements}, element_tokens, [%{"Count" => max} = ed | element_defs]) do
    {repeated_tokens, remaining_tokens} = Enum.split(element_tokens, max)
    result = repeated_tokens |> Enum.map(&parse_one(state, &1, ed)) |> Utils.reduce_result()

    case result do
      {:ok, repeated_elements} ->
        element =
          repeated_elements |> Enum.reduce({"", []}, fn {k, v}, {_, vs} -> {k, [v | vs]} end)

        parse({state, [element | elements]}, remaining_tokens, element_defs)

      {:error, _} = err ->
        err

      err ->
        {:error, err}
    end
  end

  def parse({state, elements}, [et | element_tokens], [ed | element_defs]) do
    case parse_one(state, et, ed) do
      {:ok, element} -> parse({state, [element | elements]}, element_tokens, element_defs)
      {:error, _} = err -> err
      err -> {:error, err}
    end
  end

  def parse(_, [], [%{"Required" => true, "Id" => eid} | _]) do
    {:error, "Missing required element #{eid}"}
  end

  def parse(_, [_ | _] = elements, []) do
    s = elements |> Enum.map(&Enum.join(&1, ":")) |> Enum.join("+")
    {:error, "Unrecognized elements: #{s}"}
  end

  def parse(state, _, _) do
    {:ok, state}
  end

  def parse_one(state, e, %{"Id" => id, "Components" => com_defs, "Desc" => desc}) do
    case EdifactParser.Component.parse(state, e, com_defs) do
      {:ok, cs} -> {:ok, {id, Map.merge(cs, %{"desc" => desc})}}
      {:error, err} -> {:error, "Failed to parse element #{id}: #{err}"}
      err -> {:error, "Failed to parse element #{id}: #{inspect(err)}"}
    end
  end

  def parse_one(state, [e], edef) do
    case EdifactParser.Component.parse_one(state, e, edef) do
      {:ok, element} -> {:ok, element}
      {:error, _} = err -> err
      err -> {:error, err}
    end
  end
end

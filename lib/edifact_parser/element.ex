defmodule EdifactParser.Element do
  def parse(state, [e | elements], [ed | element_defs]) do
    case parse(state, elements, element_defs) do
      {:ok, parsed_elements} ->
        case parse_one(state, e, ed) do
          {:ok, {eid, eval}} -> {:ok, Map.put(parsed_elements, eid, eval)}
          err -> err
        end

      err ->
        err
    end
  end

  def parse(_, [], [%{"Required" => true, "Id" => eid} | _]) do
    {:error, "Missing required element #{eid}"}
  end

  def parse(_, _, _) do
    {:ok, %{}}
  end

  def parse_one(state, e, %{"Id" => id, "Components" => com_defs, "Desc" => desc}) do
    case EdifactParser.Component.parse(state, e, com_defs) do
      {:ok, cs} -> {:ok, {id, Map.merge(cs, %{"desc" => desc})}}
      err -> err
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

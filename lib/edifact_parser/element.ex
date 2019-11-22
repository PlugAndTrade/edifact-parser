defmodule EdifactParser.Element do
  def parse([e | elements], [ed | element_defs]) do
    case parse(elements, element_defs) do
      {:ok, parsed_elements} ->
        case parse_one(e, ed) do
          {:ok, {eid, eval}} -> {:ok, Map.put(parsed_elements, eid, eval)}
          err -> err
        end

      err ->
        err
    end
  end

  def parse([], [%{"Required" => true, "Id" => eid} | _]) do
    {:error, "Missing required element #{eid}"}
  end

  def parse(_, _) do
    {:ok, %{}}
  end

  def parse_one(e, %{"Id" => id, "Components" => com_defs, "Desc" => desc}) do
    case EdifactParser.Component.parse(e, com_defs) do
      {:ok, cs} -> {:ok, {id, Map.merge(cs, %{"desc" => desc})}}
      err -> err
    end
  end

  def parse_one([e], %{"Id" => id, "Desc" => desc} = edef) do
    {:ok,
     {id, EdifactParser.maybe_attach_qualifier_desc(%{"val" => e, "description" => desc}, edef)}}
  end
end

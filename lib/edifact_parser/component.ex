defmodule EdifactParser.Component do
  def parse([c | components], [cd | component_defs]) do
    case parse(components, component_defs) do
      {:ok, parsed_components} ->
        case parse_one(c, cd) do
          {:ok, {cid, cval}} -> {:ok, Map.put(parsed_components, cid, cval)}
          err -> err
        end

      err ->
        err
    end
  end

  def parse(_, _) do
    {:ok, %{}}
  end

  def parse_one(c, %{"Id" => id, "Desc" => desc} = cdef) do
    {:ok, {id, EdifactParser.maybe_attach_qualifier_desc(%{"val" => c, "desc" => desc}, cdef)}}
  end
end

defmodule EdifactParser.Segment do
  def parse(segment_tokens),
    do: parse(EdifactParser.segment_definitions("UNIVERSAL"), segment_tokens)

  def parse(definitions, [{"UNH", _} = unh_tokens | segment_tokens]) do
    case parse_one(definitions, unh_tokens) do
      {:ok, {"UNH", unh}} ->
        definitions =
          Map.merge(definitions, EdifactParser.segment_definitions(Edifact.UNH.version(unh)))

        case parse(definitions, segment_tokens) do
          {:ok, segments} ->
            {:ok, [{"UNH", unh} | segments]}

          err ->
            err
        end

      err ->
        err
    end
  end

  def parse(definitions, [segment_token | segment_tokens]) do
    case parse_one(definitions, segment_token) do
      {:ok, segment} ->
        case parse(definitions, segment_tokens) do
          {:ok, segments} ->
            {:ok, [segment | segments]}

          err ->
            err
        end

      err ->
        err
    end
  end

  def parse(_, []),
    do: {:ok, []}

  def parse_one(definitions, {seg_id, element_tokens}) do
    case Map.fetch(definitions, seg_id) do
      {:ok, %{"Elements" => element_definitions}} ->
        case EdifactParser.Element.parse(element_tokens, element_definitions) do
          {:ok, elements} -> {:ok, {seg_id, elements}}
          err -> err
        end

      _ ->
        {:error, "Unknown segment #{seg_id}"}
    end
  end
end

defmodule EdifactParser.Message do
  @messages ["ORDRSP"]
            |> Enum.map(&"priv/D96A/messages/#{&1}.json")
            |> Enum.map(&File.read!/1)
            |> Enum.map(&Jason.decode!/1)
            |> Enum.reduce(%{}, fn %{"DocumentType" => t, "Release" => r} = schema, schemas ->
              Map.put(schemas, "#{r}#{t}", schema)
            end)

  def parse(segments), do: parse(%{}, segments)

  def parse(parsed, [{segid, els} | segments]) when segid in ["UNA", "UNB", "UNT", "UNZ"] do
    parse(Map.put(parsed, segid, els), segments)
  end

  def parse(parsed, [{"UNH", unh} | segments]) do
    {:ok, {parsed, {rest, _defs}}} =
      parse_message(
        parsed,
        segments,
        message_definition(Edifact.UNH.version(unh) <> Edifact.UNH.message_type(unh))
      )

    {:ok, {parsed, rest}} = parse(parsed, rest)
    {:ok, {Map.merge(parsed, %{"UNH" => unh}), rest}}
  end

  def parse(parsed, rest) do
    {:ok, {parsed, rest}}
  end

  def parse_message(
        parsed,
        [{seg_id, _} | _] = segments,
        [%{"Loop" => [%{"ID" => seg_id} | _] = inner_defs} | _] = defs
      ) do
    {:ok, {inner_parsed, {rest, _}}} = parse_message(%{}, segments, inner_defs)
    parsed = Map.update(parsed, seg_id, [inner_parsed], &List.insert_at(&1, -1, inner_parsed))
    parse_message(parsed, rest, defs)
  end

  # TODO limit by max value
  def parse_message(
        parsed,
        [{seg_id, seg} | segments],
        [%{"ID" => seg_id, "Max" => _max} | _] = defs
      ) do
    parsed = Map.update(parsed, seg_id, [seg], &List.insert_at(&1, -1, seg))
    parse_message(parsed, segments, defs)
  end

  def parse_message(parsed, [{seg_id, seg} | segments], [%{"ID" => seg_id} | defs]) do
    parsed = Map.put(parsed, seg_id, seg)
    parse_message(parsed, segments, defs)
  end

  def parse_message(parsed, segments, [%{"Min" => 0} | defs]) do
    parse_message(parsed, segments, defs)
  end

  def parse_message(parsed, segments, [%{"ID" => seg_id, "Max" => _} = current_def | defs]) do
    case parsed do
      %{^seg_id => [_ | _]} -> parse_message(parsed, segments, defs)
      _ -> {:error, %{progress: parsed, remainder: segments, def: current_def}}
    end
  end

  def parse_message(parsed, segs, defs) do
    {:ok, {parsed, {segs, defs}}}
  end

  def message_definition(type), do: @messages |> Map.get(type) |> Map.get("TransactionSet")
end

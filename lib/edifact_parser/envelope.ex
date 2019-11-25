defmodule EdifactParser.Envelope do
  def parse(segments) do
    with {:ok, {una, rest}} <- parse("UNA", segments),
         {:ok, {unb, rest}} <- parse("UNB", rest),
         {:ok, {messages, rest}} <- parse("UNH", rest),
         {:ok, {unz, rest}} <- parse("UNZ", rest) do
      {:ok, {%{"UNA" => una, "UNB" => unb, "UNH" => messages, "UNZ" => unz}, rest}}
    else
      {:error, _} = err -> err
      err -> {:error, err}
    end
  end

  def parse(segid, [{segid, els} | segments]) when segid in ["UNA", "UNB", "UNZ"] do
    {:ok, {els, segments}}
  end

  def parse("UNH", [{"UNH", _} | _] = segments) do
    parse_messages([], segments)
  end

  def parse(expected, [{actual, _} | _]) do
    {:error, "Unexpected segment #{actual}, expected #{expected}"}
  end

  def parse(expected, []) do
    {:error, "Unexpected end of segments, expected #{expected}"}
  end

  def parse_messages(messages, [{"UNH", _} | _] = segments) do
    case EdifactParser.Message.parse(segments) do
      {:ok, {message, rest}} ->
        parse_messages(List.insert_at(messages, -1, message), rest)

      {:error, _} = err ->
        err

      err ->
        {:error, err}
    end
  end

  def parse_messages(messages, segments), do: {:ok, {messages, segments}}
end

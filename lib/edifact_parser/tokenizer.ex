defmodule EdifactParser.Tokenizer do
  def tokenize(
        "UNA" <>
          <<c::binary-size(1), e::binary-size(1), d::binary-size(1), r::binary-size(1),
            _::binary-size(1), s::binary-size(1)>> <> <<doc::binary>>
      ) do
    una = Edifact.UNA.init(c, e, d, r, s)
    [{"UNA", Edifact.UNA.tokens(una)} | tokenize(una, trim(doc))]
  end

  def tokenize(doc) do
    una = Edifact.UNA.default()
    [{"UNA", Edifact.UNA.tokens(una)} | tokenize(una, trim(doc))]
  end

  def tokenize(%{segment: s, component: c, element: e, release: r}, doc) do
    doc
    |> String.split(~r"(?<!#{Regex.escape(r)})#{Regex.escape(s)}\s*", trim: true)
    |> Enum.map(&String.split(&1, ~r"(?<!#{Regex.escape(r)})#{Regex.escape(e)}"))
    |> Enum.map(fn [seg_type | elements] ->
      {seg_type,
       Enum.map(elements, &String.split(&1, ~r"(?<!#{Regex.escape(r)})#{Regex.escape(c)}"))}
    end)
  end

  def trim(doc), do: String.replace(doc, ~r(^\s*), "")
end

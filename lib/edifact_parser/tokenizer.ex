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
    seg_p = ~r"(?<!#{Regex.escape(r)})#{Regex.escape(s)}\s*"
    el_p = ~r"(?<!#{Regex.escape(r)})#{Regex.escape(e)}"
    comp_p = ~r"(?<!#{Regex.escape(r)})#{Regex.escape(c)}"
    rel_p = ~r"#{Regex.escape(r)}(?=.)"

    doc
    |> String.split(seg_p, trim: true)
    |> Enum.map(&String.split(&1, el_p))
    |> Enum.map(fn [seg_type | elements] ->
      {String.replace(seg_type, rel_p, ""),
       Enum.map(
         elements,
         fn e -> e |> String.split(comp_p) |> Enum.map(&String.replace(&1, rel_p, "")) end
       )}
    end)
  end

  def trim(doc), do: String.replace(doc, ~r(^\s*), "")
end

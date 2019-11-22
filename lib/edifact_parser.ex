defmodule EdifactParser do
  @moduledoc """
  Documentation for EdifactParser.
  """

  @segment_definitions ["priv/segments.json", "priv/D96A/segments.json"]
                       |> Enum.map(&File.read!/1)
                       |> Enum.map(&Jason.decode!/1)
                       |> Enum.reduce(%{}, fn %{"Release" => t} = s, schemas ->
                         Map.put(schemas, t, s)
                       end)

  @qualifiers_definitions "priv/D96A/qualifiers.json"
                          |> File.read!()
                          |> Jason.decode!()

  def segment_definitions(version), do: Map.fetch!(@segment_definitions, version)
  def qualifier_definitions, do: @qualifiers_definitions

  @doc """
  parse

  ## Examples

      iex> EdifactParser.parse("")
      {:ok, %{}}

  """
  def parse("") do
    {:ok, %{}}
  end

  def parse(doc) do
    tokens = EdifactParser.Tokenizer.tokenize(doc)
    {:ok, segs} = EdifactParser.Segment.parse(tokens)
    {:ok, {parsed, _rest}} = EdifactParser.Message.parse(segs)
    {:ok, parsed}
  end

  def maybe_attach_qualifier_desc(%{"val" => qual} = val, %{"QualifierRef" => type}) do
    qualifier_desc =
      qualifier_definitions()
      |> Map.get(type, %{})
      |> Map.get(qual, "")

    Map.put(val, "qualifier_desc", qualifier_desc)
  end

  def maybe_attach_qualifier_desc(val, _), do: val
end

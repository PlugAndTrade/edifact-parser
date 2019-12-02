defmodule EdifactParser do
  @moduledoc """
  Documentation for EdifactParser.
  """

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
    with tokens <- EdifactParser.Tokenizer.tokenize(doc),
         {:ok, segs} <- EdifactParser.Segment.parse(tokens),
         {:ok, {parsed, _rest}} <- EdifactParser.Envelope.parse(segs) do
      {:ok, parsed}
    else
      {:error, _} = err -> err
      err -> {:error, err}
    end
  end

  def parse_file(path) do
    {:ok, parsed} = File.read!(path)
                    |> parse()
    Jason.encode!(parsed)
  end
end

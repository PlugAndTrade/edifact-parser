defmodule EdifactParserTest do
  use ExUnit.Case
  doctest EdifactParser

  test "parse empty" do
    assert EdifactParser.parse("") == {:ok, %{}}
  end
end

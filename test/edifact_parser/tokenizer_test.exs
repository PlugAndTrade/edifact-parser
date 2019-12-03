defmodule EdifactParser.TokenizerTest do
  use ExUnit.Case

  test "simple" do
    %{segment: s, component: c, element: e} = una = Edifact.UNA.default()
    doc = "s1id#{e}s1e1c1#{c}s1e1c2#{c}s1e1c3#{e}s1e2c1#{c}s1e2c2#{s}s2id#{e}s2e1c1#{s}"
    assert [
      {"s1id", [["s1e1c1", "s1e1c2", "s1e1c3"], ["s1e2c1", "s1e2c2"]]},
      {"s2id", [["s2e1c1"]]}
    ] == EdifactParser.Tokenizer.tokenize(una, doc)
  end

  test "release char" do
    %{segment: s, component: c, element: e, release: r} = una = Edifact.UNA.default()
    doc = "s1#{r}#{s}id#{e}s1#{r}#{s}e1#{r}#{e}c1#{r}#{c}#{c}s1#{r}#{s}e1#{r}#{e}c2#{r}#{c}#{e}s1#{r}#{s}e2#{r}#{e}c1#{r}#{c}#{c}s1#{r}#{s}e2#{r}#{e}c2#{r}#{c}#{s}"
    assert [
      {"s1#{s}id", [["s1#{s}e1#{e}c1#{c}", "s1#{s}e1#{e}c2#{c}"], ["s1#{s}e2#{e}c1#{c}", "s1#{s}e2#{e}c2#{c}"]]}
    ] == EdifactParser.Tokenizer.tokenize(una, doc)
  end

  test "empty component" do
    %{segment: s, component: c, element: e} = una = Edifact.UNA.default()
    doc = "s1id#{e}s1e1c1#{c}#{c}s1e1c3#{s}"
    assert [
      {"s1id", [["s1e1c1", "", "s1e1c3"]]}
    ] == EdifactParser.Tokenizer.tokenize(una, doc)
  end

  test "empty element" do
    %{segment: s, element: e} = una = Edifact.UNA.default()
    doc = "s1id#{e}s1e1c1#{e}#{e}s1e3c1#{s}"
    assert [
      {"s1id", [["s1e1c1"], [""], ["s1e3c1"]]}
    ] == EdifactParser.Tokenizer.tokenize(una, doc)
  end

  test "remove whitespace between segments" do
    %{segment: s} = una = Edifact.UNA.default()
    doc = "seg1\n#{s}\nseg2\t#{s} seg3 #{s}\n seg4\n\t#{s}\n\tseg5\n\t #{s}\n\t seg6#{s}"
    assert [
      {"seg1\n", []},
      {"seg2\t", []},
      {"seg3 ", []},
      {"seg4\n\t", []},
      {"seg5\n\t ", []},
      {"seg6", []},
    ] == EdifactParser.Tokenizer.tokenize(una, doc)
  end
end

defmodule EdifactParser.ElementTest do
  use ExUnit.Case

  test "parse empty" do
    assert {:ok, %{}} == EdifactParser.Element.parse(%{}, [], [])
  end

  test "parse missing required element" do
    assert {:error, _} =
             EdifactParser.Element.parse(
               %{charset: :ascii},
               [],
               [%{"Id" => "e_id", "Required" => true}]
             )
  end

  test "parse too many elements" do
    assert {:error, _} =
             EdifactParser.Element.parse(
               %{charset: :ascii},
               [["foo", "bar", "baz"]],
               []
             )
  end

  test "parse multiple simple elements" do
    assert {:ok,
            %{
              "e1_id" => %{"val" => "foo", "desc" => "foo desc"},
              "e2_id" => %{"val" => "bar", "desc" => "bar desc"},
              "e3_id" => %{"val" => "baz", "desc" => "baz desc"}
            }} ==
             EdifactParser.Element.parse(
               %{charset: :ascii},
               [["foo"], ["bar"], ["baz"]],
               [
                 %{"Id" => "e1_id", "Desc" => "foo desc"},
                 %{"Id" => "e2_id", "Desc" => "bar desc"},
                 %{"Id" => "e3_id", "Desc" => "baz desc"}
               ]
             )
  end

  test "parse simple repeating element" do
    assert {:ok,
            %{
              "e_id" => [
                %{"val" => "foo", "desc" => "element desc"},
                %{"val" => "bar", "desc" => "element desc"},
                %{"val" => "baz", "desc" => "element desc"}
              ]
            }} ==
             EdifactParser.Element.parse(
               %{charset: :ascii},
               [["foo"], ["bar"], ["baz"]],
               [
                 %{"Id" => "e_id", "Desc" => "element desc", "Count" => 3}
               ]
             )
  end

  test "parse_one single component" do
    assert {:ok, {"e_id", %{"val" => "foo", "desc" => "element desc"}}} ==
             EdifactParser.Element.parse_one(
               %{charset: :ascii},
               ["foo"],
               %{"Id" => "e_id", "Desc" => "element desc"}
             )
  end

  test "parse_one multple components" do
    assert {:ok,
            {"e_id",
             %{
               "c1_id" => %{"val" => "foo", "desc" => "foo desc"},
               "c2_id" => %{"val" => "bar", "desc" => "bar desc"},
               "c3_id" => %{"val" => "baz", "desc" => "baz desc"},
               "desc" => "seg desc"
             }}} ==
             EdifactParser.Element.parse_one(
               %{charset: :ascii},
               ["foo", "bar", "baz"],
               %{
                 "Id" => "e_id",
                 "Desc" => "seg desc",
                 "Components" => [
                   %{"Id" => "c1_id", "Desc" => "foo desc"},
                   %{"Id" => "c2_id", "Desc" => "bar desc"},
                   %{"Id" => "c3_id", "Desc" => "baz desc"}
                 ]
               }
             )
  end
end

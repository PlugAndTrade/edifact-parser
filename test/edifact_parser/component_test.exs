defmodule EdifactParser.ComponentTest do
  use ExUnit.Case

  test "parse_one text" do
    val = "c_val"
    desc = "c_desc"
    cid = "c_id"

    assert {:ok, {cid, %{"val" => val, "desc" => desc}}} ==
             EdifactParser.Component.parse_one(
               %{charset: :ascii},
               val,
               %{"Id" => cid, "Desc" => desc}
             )
  end

  test "parse_one empty optional" do
    val = ""
    desc = "c_desc"
    cid = "c_id"

    assert {:ok, {cid, %{"val" => val, "desc" => desc}}} ==
             EdifactParser.Component.parse_one(
               %{charset: :ascii},
               val,
               %{"Id" => cid, "Desc" => desc, "Required" => false}
             )
  end

  test "parse_one empty zero minLength" do
    val = ""
    desc = "c_desc"
    cid = "c_id"

    assert {:ok, {cid, %{"val" => val, "desc" => desc}}} ==
             EdifactParser.Component.parse_one(
               %{charset: :ascii},
               val,
               %{"Id" => cid, "Desc" => desc, "minLength" => 0}
             )
  end

  test "parse_one qualifier" do
    qualifier = "Test indicator"

    val =
      EdifactParser.Component.qualifier_definitions()
      |> Map.get(qualifier)
      |> Map.keys()
      |> List.first()

    q_val =
      EdifactParser.Component.qualifier_definitions()
      |> Map.get(qualifier)
      |> Map.get(val)

    assert {:ok, {"cid", %{"val" => val, "desc" => "comp desc", "qualifier_desc" => q_val}}} ==
             EdifactParser.Component.parse_one(
               %{},
               val,
               %{"Id" => "cid", "Desc" => "comp desc", "QualifierRef" => qualifier}
             )
  end

  test "parse_one missing qualifier" do
    qualifier = "Test indicator"

    assert {:error, _} =
             EdifactParser.Component.parse_one(
               %{},
               "missing_value",
               %{"Id" => "cid", "Desc" => "comp desc", "QualifierRef" => qualifier}
             )
  end

  test "parse missing required component" do
    assert {:error, _} =
             EdifactParser.Component.parse(
               {%{}, []},
               [],
               [%{"Id" => "cid", "Required" => true}]
             )
  end

  test "parse too many components" do
    assert {:error, _} =
             EdifactParser.Component.parse(
               {%{}, []},
               ["some_val"],
               []
             )
  end

  test "parse component list" do
    components = [
      "foo",
      "bar",
      "baz",
      "1"
    ]

    defs = [
      %{"Id" => "first", "Desc" => "first description"},
      %{"Id" => "second", "Desc" => "second description"},
      %{"Id" => "third", "Desc" => "third description"},
      %{"Id" => "forth", "Desc" => "forth description"},
      %{"Id" => "ignored", "Desc" => "forth description", "Required" => false}
    ]

    expected = %{
      "first" => %{"val" => "foo", "desc" => "first description"},
      "second" => %{"val" => "bar", "desc" => "second description"},
      "third" => %{"val" => "baz", "desc" => "third description"},
      "forth" => %{"val" => "1", "desc" => "forth description"}
    }

    assert {:ok, expected} ==
             EdifactParser.Component.parse(
               %{charset: :ascii},
               components,
               defs
             )
  end
end

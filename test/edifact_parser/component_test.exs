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
               %{},
               ["some_val"],
               []
             )
  end

  test "parse simple component list" do
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

  test "parse repeated components" do
    components = [
      "foo",
      "bar",
      "baz"
    ]

    defs = [
      %{"Id" => "repeated", "Count" => 3, "Desc" => "repeated description"},
    ]

    expected = %{
      "repeated" => [
        %{"val" => "foo", "desc" => "repeated description"},
        %{"val" => "bar", "desc" => "repeated description"},
        %{"val" => "baz", "desc" => "repeated description"},
      ]
    }

    assert {:ok, expected} ==
             EdifactParser.Component.parse(
               %{charset: :ascii},
               components,
               defs
             )
  end

  test "parse components one group" do
    components = ["foo", "bar", "baz"]

    defs = [
      %{"Id" => "A", "Desc" => "Group", "Count" => 1, "Group" => [
        %{"Id" => "A1", "Desc" => "first in group"},
        %{"Id" => "A2", "Desc" => "second in group"},
        %{"Id" => "A3", "Desc" => "third in group"}
      ]}
    ]

    expected = %{
      "A1" => [%{
        "A1" => %{"val" => "foo", "desc" => "first in group"},
        "A2" => %{"val" => "bar", "desc" => "second in group"},
        "A3" => %{"val" => "baz", "desc" => "third in group"},
      }]
    }

    assert {:ok, expected} ==
             EdifactParser.Component.parse(
               %{charset: :ascii},
               components,
               defs
             )
  end

  test "parse components non complete group" do
    components = ["foo1", "bar1", "baz1", "foo2", "bar2"]

    defs = [
      %{"Id" => "A", "Desc" => "Group", "Count" => 2, "Group" => [
        %{"Id" => "A1", "Desc" => "first in group"},
        %{"Id" => "A2", "Desc" => "second in group"},
        %{"Id" => "A3", "Desc" => "third in group"}
      ]}
    ]

    expected = %{
      "A1" => [
        %{
          "A1" => %{"val" => "foo1", "desc" => "first in group"},
          "A2" => %{"val" => "bar1", "desc" => "second in group"},
          "A3" => %{"val" => "baz1", "desc" => "third in group"},
        },
        %{
          "A1" => %{"val" => "foo2", "desc" => "first in group"},
          "A2" => %{"val" => "bar2", "desc" => "second in group"},
        }
      ]
    }

    assert {:ok, expected} ==
             EdifactParser.Component.parse(
               %{charset: :ascii},
               components,
               defs
             )
  end

  test "parse complex component list" do
    components = [
      "foo",
      "bar",
      "",
      "41a",
      "41b",
      "42a",
      "",
      "baz"
    ]

    defs = [
      %{"Id" => "first", "Desc" => "first description"},
      %{"Id" => "second", "Desc" => "second description"},
      %{"Id" => "third", "Desc" => "third description", "Required" => false},
      %{"Count" => 2, "Group" => [
        %{"Id" => "forthA", "Desc" => "forth first description"},
        %{"Id" => "forthB", "Desc" => "forth second description", "Required" => false},
      ]},
      %{"Id" => "fifth", "Desc" => "fifth description"},
      %{"Id" => "ignored", "Desc" => "ignored description", "Required" => false}
    ]

    expected = %{
      "first" => %{"val" => "foo", "desc" => "first description"},
      "second" => %{"val" => "bar", "desc" => "second description"},
      "third" => %{"val" => "", "desc" => "third description"},
      "forthA" => [
        %{
          "forthA" => %{"val" => "41a", "desc" => "forth first description"},
          "forthB" => %{"val" => "41b", "desc" => "forth second description"},
        },
        %{
          "forthA" => %{"val" => "42a", "desc" => "forth first description"},
          "forthB" => %{"val" => "", "desc" => "forth second description"},
        }
      ],
      "fifth" => %{"val" => "baz", "desc" => "fifth description"}
    }

    assert {:ok, expected} ==
             EdifactParser.Component.parse(
               %{charset: :ascii},
               components,
               defs
             )
  end
end

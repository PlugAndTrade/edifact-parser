defmodule Edifact.UNH do
  def version(%{"S009" => %{"0052" => %{"val" => ver}, "0054" => %{"val" => rel}}}),
    do: ver <> rel

  def message_type(%{"S009" => %{"0065" => %{"val" => type}}}),
    do: type
end

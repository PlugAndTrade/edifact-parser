defmodule Edifact.UNB do
  def charset(%{"S001" => %{"0001" => %{"val" => "UNOA"}}}), do: :ascii
  def charset(%{"S001" => %{"0001" => %{"val" => "UNOB"}}}), do: :ascii
  def charset(%{"S001" => %{"0001" => %{"val" => "UNOC"}}}), do: :iso_8859_1
  def charset(%{"S001" => %{"0001" => %{"val" => "UNOD"}}}), do: :iso_8859_2
  def charset(%{"S001" => %{"0001" => %{"val" => "UNOE"}}}), do: :iso_8859_5
  def charset(%{"S001" => %{"0001" => %{"val" => "UNOF"}}}), do: :iso_8859_7
end

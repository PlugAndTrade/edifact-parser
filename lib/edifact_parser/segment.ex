defmodule EdifactParser.Segment do
  def parse(segment_tokens) do
    case parse(
           {%{charset: :ascii, defs: EdifactParser.segment_definitions("UNIVERSAL")}, []},
           segment_tokens
         ) do
      {:ok, {_, segments}} -> {:ok, Enum.reverse(segments)}
      {:error, _} = err -> err
      err -> {:error, err}
    end
  end

  def parse({state, segments}, [segment_token | segment_tokens]) do
    case parse_one(state, segment_token) do
      {:ok, segment} ->
        parse({update_state(state, segment), [segment | segments]}, segment_tokens)

      {:error, _} = err ->
        err

      err ->
        {:error, err}
    end
  end

  def parse(state, []),
    do: {:ok, state}

  def parse_one(%{defs: defs} = state, {seg_id, element_tokens}) do
    case Map.fetch(defs, seg_id) do
      {:ok, %{"Elements" => element_definitions}} ->
        case EdifactParser.Element.parse(state, element_tokens, element_definitions) do
          {:ok, elements} -> {:ok, {seg_id, elements}}
          {:error, msg} -> {:error, "Failed to parse segment #{seg_id}: #{msg}"}
          err -> {:error, "Failed to parse segment #{seg_id}: #{inspect(err)}"}
        end

      _ ->
        {:error, "Unknown segment #{seg_id}"}
    end
  end

  defp update_state(state, {"UNH", unh}) do
    Map.update(
      state,
      :defs,
      %{},
      &Map.merge(&1, EdifactParser.segment_definitions(Edifact.UNH.version(unh)))
    )
  end

  defp update_state(state, {"UNB", unb}) do
    Map.put(
      state,
      :charset,
      Edifact.UNB.charset(unb)
    )
  end

  defp update_state(state, {_segid, _seg}), do: state
end

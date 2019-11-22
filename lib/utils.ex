defmodule Utils do
  def reduce_result([{fr, fv} | results]) do
    {r, vs} =
      Enum.reduce(results, {fr, [fv]}, fn {r, v}, {rr, vv} ->
        case {r, rr} do
          {:ok, :ok} -> {:ok, [v | vv]}
          {:ok, :error} -> {:error, vv}
          {:error, :error} -> {:error, [v | vv]}
          {:error, :ok} -> {:error, [v]}
        end
      end)

    {r, Enum.reverse(vs)}
  end
end

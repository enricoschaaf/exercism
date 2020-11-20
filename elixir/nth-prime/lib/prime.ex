defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(1) do
    2
  end

  def nth(count) when count > 0 do
    Stream.iterate(3, &(&1 + 2))
    |> Stream.filter(&prime?/1)
    |> Enum.take(count - 1)
    |> List.last()
  end

  defp prime?(n), do: prime?(n, 3)
  defp prime?(n, k) when n < k * k, do: true
  defp prime?(n, k) when rem(n, k) == 0, do: false
  defp prime?(n, k), do: prime?(n, k + 2)
end

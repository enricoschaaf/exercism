defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) do
    nth_recursion(count, 2, 3)
  end

  defp nth_recursion(1, nth, _) do
    nth
  end

  defp nth_recursion(count, nth, i) when count > 0 do
    if prime?(i) do
      nth_recursion(count - 1, i, i + 2)
    else
      nth_recursion(count, nth, i + 2)
    end
  end

  defp prime?(number) do
    !Enum.any?(2..(Kernel.floor(number / 2) + 1), &(rem(number, &1) == 0))
  end
end

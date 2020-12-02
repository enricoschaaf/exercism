defmodule PerfectNumbers do
  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: {:ok, atom} | {:error, String.t()}
  def classify(1), do: {:ok, :deficient}

  def classify(number) when number > 0 do
    aliquot_sum =
      1..Kernel.floor(number / 2)
      |> Enum.filter(&(rem(number, &1) == 0))
      |> Enum.sum()

    cond do
      aliquot_sum == number -> {:ok, :perfect}
      aliquot_sum > number -> {:ok, :abundant}
      aliquot_sum < number -> {:ok, :deficient}
    end
  end

  def classify(_number) do
    {:error, "Classification is only possible for natural numbers."}
  end
end

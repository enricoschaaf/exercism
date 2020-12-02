defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t()) :: non_neg_integer
  def to_decimal(string) do
    if String.match?(string, ~r/^[0,1]+$/) do
      string
      |> String.codepoints()
      |> Enum.reverse()
      |> Enum.with_index()
      |> Enum.map(fn {c, i} -> String.to_integer(c) * :math.pow(2, i) end)
      |> Enum.sum()
    else
      0
    end
  end
end

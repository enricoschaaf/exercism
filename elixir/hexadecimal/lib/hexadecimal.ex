defmodule Hexadecimal do
  @hex ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"]
  @doc """
    Accept a string representing a hexadecimal value and returns the
    corresponding decimal value.
    It returns the integer 0 if the hexadecimal is invalid.
    Otherwise returns an integer representing the decimal value.

    ## Examples

      iex> Hexadecimal.to_decimal("invalid")
      0

      iex> Hexadecimal.to_decimal("af")
      175

  """

  @spec to_decimal(binary) :: integer
  def to_decimal(hex) do
    if String.match?(hex, ~r/^[0-9a-fA-F]+$/) do
      hex
      |> String.downcase()
      |> String.codepoints()
      |> Enum.reverse()
      |> Enum.with_index()
      |> Enum.map(fn {c, i} ->
        Enum.find_index(@hex, &(c == &1)) * :math.pow(16, i)
      end)
      |> Enum.sum()
    else
      0
    end
  end
end

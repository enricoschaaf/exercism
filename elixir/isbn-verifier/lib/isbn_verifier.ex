defmodule IsbnVerifier do
  @doc """
    Checks if a string is a valid ISBN-10 identifier

    ## Examples

      iex> IsbnVerifier.isbn?("3-598-21507-X")
      true

      iex> IsbnVerifier.isbn?("3-598-2K507-0")
      false

  """
  @spec isbn?(String.t()) :: boolean
  def isbn?(isbn) do
    if String.match?(isbn, ~r/^(\d-?){9}[\dX]$/) do
      isbn
      |> String.replace("-", "")
      |> String.codepoints()
      |> Enum.zip(10..1)
      |> Enum.map(&weight_checksum/1)
      |> Enum.sum()
      |> rem(11)
      |> Kernel.==(0)
    else
      false
    end
  end

  defp weight_checksum({"X", 1}), do: 10

  defp weight_checksum({digit, weight}) do
    String.to_integer(digit) * weight
  end
end

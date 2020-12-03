defmodule Transpose do
  @doc """
  Given an input text, output it transposed.

  Rows become columns and columns become rows. See https://en.wikipedia.org/wiki/Transpose.

  If the input has rows of different lengths, this is to be solved as follows:
    * Pad to the left with spaces.
    * Don't pad to the right.

  ## Examples
  iex> Transpose.transpose("ABC\nDE")
  "AD\nBE\nC"

  iex> Transpose.transpose("AB\nDEF")
  "AD\nBE\n F"
  """

  @spec transpose(String.t()) :: String.t()
  def transpose(input) do
    row = String.split(input, "\n")
    len = row |> Enum.map(&String.length/1) |> Enum.max()

    row
    |> Enum.map(&(String.pad_trailing(&1, len) |> String.codepoints()))
    |> Enum.zip()
    |> Enum.map_join("\n", &Tuple.to_list/1)
    |> String.trim_trailing()
  end
end

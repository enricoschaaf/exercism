defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word |> String.downcase() |> String.codepoints() |> Enum.map(&match/1) |> Enum.sum()
  end

  defp match(word) do
    cond do
      word in ~w(a e i o u l n r s t) ->
        1

      word in ~w(d g) ->
        2

      word in ~w(b c m p) ->
        3

      word in ~w(f h v w y) ->
        4

      word == "k" ->
        5

      word in ~w(j x) ->
        8

      word in ~w(q z) ->
        10

      word ->
        0
    end
  end
end

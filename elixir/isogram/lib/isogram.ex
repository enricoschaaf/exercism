defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    word = Regex.scan(~r/\w/u, sentence)
    word == Enum.uniq(word)
  end
end

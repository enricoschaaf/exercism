defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    candidates |> Enum.filter(&anagram?(&1, base))
  end

  defp anagram?(candidate, base) do
    downcase_candidate = String.downcase(candidate)
    downcase_base = String.downcase(base)

    cond do
      downcase_candidate == downcase_base ->
        false

      String.codepoints(downcase_candidate) |> Enum.frequencies() ==
          String.codepoints(downcase_base) |> Enum.frequencies() ->
        true

      true ->
        false
    end
  end
end

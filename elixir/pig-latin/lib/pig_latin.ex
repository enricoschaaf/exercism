defmodule PigLatin do
  @vowels ~w(a e i o u)
  @groups ["ch", "qu", "squ", "thr", "th", "sch"]
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split()
    |> Enum.map(&translate_word(&1))
    |> Enum.join(" ")
  end

  defp translate_word(word) do
    index =
      cond do
        (String.starts_with?(word, ~w(x y)) and String.at(word, 1) not in @vowels) or
            String.starts_with?(word, @vowels) ->
          0

        String.starts_with?(word, ~w(squ thr sch)) ->
          3

        String.starts_with?(word, ~w(ch qu thr th)) ->
          2

        true ->
          String.codepoints(word)
          |> Enum.find_index(&(&1 in @vowels))
      end

    {head, tail} = String.split_at(word, index)

    "#{tail}#{head}ay"
  end
end

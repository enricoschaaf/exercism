defmodule Say do
  @doc """
  Translate a positive integer into English.
  """
  @spec in_english(integer) :: {atom, String.t()}

  def in_english(0), do: {:ok, "zero"}

  def in_english(number) when number < 0 or number > 999_999_999_999 do
    {:error, "number is out of range"}
  end

  def in_english(number) do
    {:ok, in_english_recursion(number)}
  end

  defp in_english_recursion(number, string \\ "") do
    case number do
      1 -> string <> "one"
      2 -> string <> "two"
      3 -> string <> "three"
      4 -> string <> "four"
      5 -> string <> "five"
      6 -> string <> "six"
      7 -> string <> "seven"
      8 -> string <> "eight"
      9 -> string <> "nine"
      10 -> string <> "ten"
      11 -> string <> "eleven"
      12 -> string <> "twelve"
      13 -> string <> "thirteen"
      15 -> string <> "fifteen"
      18 -> string <> "eighteen"
      20 -> string <> "twenty"
      30 -> string <> "thirty"
      40 -> string <> "forty"
      50 -> string <> "fifty"
      80 -> string <> "eighty"
      number -> tanslate(number, string)
    end
  end

  defp tanslate(number, string) do
    cond do
      number == 0 ->
        string |> String.trim() |> String.replace_trailing("-", "")

      number in [14, 16, 17, 19] ->
        string <> "#{in_english_recursion(number - 10)}teen"

      number in [60, 70, 90] ->
        string <> "#{in_english_recursion(floor(number / 10))}ty"

      number in 20..99 ->
        rouned = floor(number / 10) * 10

        in_english_recursion(
          number - rouned,
          "#{string}#{in_english_recursion(rouned)}-"
        )

      number in 100..999 ->
        divided = floor(number / 100)

        in_english_recursion(
          number - divided * 100,
          string <>
            "#{in_english_recursion(divided)} hundred "
        )

      number in 1000..999_999 ->
        divided = floor(number / 1000)

        in_english_recursion(
          number - divided * 1000,
          string <>
            "#{in_english_recursion(divided)} thousand "
        )

      number in 1_000_000..999_999_999 ->
        divided = floor(number / 1_000_000)

        in_english_recursion(
          number - divided * 1_000_000,
          string <>
            "#{in_english_recursion(divided)} million "
        )

      number in 1_000_000_000..999_999_999_999 ->
        divided = floor(number / 1_000_000_000)

        in_english_recursion(
          number - divided * 1_000_000_000,
          string <>
            "#{in_english_recursion(divided)} billion "
        )
    end
  end
end

defmodule Bob do
  def hey(input) do
    cond do
      silence?(input) ->
        "Fine. Be that way!"

      shout_question?(input) ->
        "Calm down, I know what I'm doing!"

      shout?(input) ->
        "Whoa, chill out!"

      question?(input) ->
        "Sure."

      true ->
        "Whatever."
    end
  end

  defp silence?(input) do
    input |> String.trim() |> String.length() == 0
  end

  defp question?(input) do
    input |> String.trim() |> String.last() == "?"
  end

  defp shout?(input) do
    chars = input |> String.replace(~r/[^[:alpha:]]/u, "")

    chars != "" &&
      chars |> String.upcase() == chars
  end

  defp shout_question?(input) do
    chars = input |> String.replace(~r/[^[:alpha:]]/u, "")

    chars != "" && input |> String.trim() |> String.last() == "?" &&
      chars |> String.upcase() == chars
  end
end

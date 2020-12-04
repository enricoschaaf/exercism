defmodule Markdown do
  @doc """
    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

    iex> Markdown.parse("This is a paragraph")
    "<p>This is a paragraph</p>"

    iex> Markdown.parse("#Header!\n* __Bold Item__\n* _Italic Item_")
    "<h1>Header!</h1><ul><li><em>Bold Item</em></li><li><i>Italic Item</i></li></ul>"
  """
  @spec parse(String.t()) :: String.t()
  def parse(m) do
    m
    |> String.split("\n")
    |> Enum.map_join(&process/1)
    |> replace_md()
  end

  defp process("#" <> rest), do: header(rest, 1)
  defp process("* " <> rest), do: "<li>#{rest}</li>"
  defp process(t), do: "<p>#{t}</p>"

  defp header("#" <> rest, acc), do: header(rest, acc + 1)
  defp header(" " <> rest, acc), do: "<h#{acc}>#{rest}</h#{acc}>"

  defp replace_md(w) do
    String.replace(w, ~r/__(.*)__/, "<strong>\\1</strong>")
    |> String.replace(~r/_(.*)_/, "<em>\\1</em>")
    |> String.replace(~r/<li>.*<\/li>/, "<ul>\\0</ul>")
  end
end

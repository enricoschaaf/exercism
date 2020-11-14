defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()

  def encode("") do
    ""
  end

  def encode(string) do
    string
    |> String.codepoints()
    |> Enum.chunk_by(& &1)
    |> Enum.map_join(&construct/1)
  end

  defp construct([head | []]) do
    head
  end

  defp construct([head | tail]) do
    "#{Enum.count(tail) + 1}#{head}"
  end

  @spec decode(String.t()) :: String.t()

  def decode("") do
    ""
  end

  def decode(string) do
    string
    |> String.split(~r/\d+|[a-zA-Z]/, include_captures: true, trim: true)
    |> reconstruct()
  end

  defp reconstruct([head | []]), do: head

  defp reconstruct([head | tail]) do
    match(head, tail) <> reconstruct(tail)
  end

  defp match(head, tail) do
    if String.match?(head, ~r/\d/) do
      String.duplicate(List.first(tail), String.to_integer(head) - 1)
    else
      head
    end
  end
end

defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    ""
    |> match(:pling, number)
    |> match(:plang, number)
    |> match(:plong, number)
    |> match(:default, number)
  end

  defp match(str, :pling, number) when rem(number, 3) == 0, do: str <> "Pling"
  defp match(str, :plang, number) when rem(number, 5) == 0, do: str <> "Plang"
  defp match(str, :plong, number) when rem(number, 7) == 0, do: str <> "Plong"
  defp match("", :default, number), do: Integer.to_string(number)
  defp match(str, _, _number), do: str
end

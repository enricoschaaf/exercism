defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    match(number, "")
  end

  defp match(number, roman_number) do
    cond do
      number >= 1000 -> match(number - 1000, roman_number <> "M")
      number >= 900 -> match(number - 900, roman_number <> "CM")
      number >= 500 -> match(number - 500, roman_number <> "D")
      number >= 400 -> match(number - 400, roman_number <> "CD")
      number >= 100 -> match(number - 100, roman_number <> "C")
      number >= 90 -> match(number - 90, roman_number <> "XC")
      number >= 50 -> match(number - 50, roman_number <> "L")
      number >= 40 -> match(number - 40, roman_number <> "XL")
      number >= 10 -> match(number - 10, roman_number <> "X")
      number >= 9 -> match(number - 9, roman_number <> "IX")
      number >= 5 -> match(number - 5, roman_number <> "V")
      number >= 4 -> match(number - 4, roman_number <> "IV")
      number >= 1 -> match(number - 1, roman_number <> "I")
      number == 0 -> roman_number
    end
  end
end

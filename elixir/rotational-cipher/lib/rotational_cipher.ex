defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """

  @lowercase ?a..?z
  @uppercase ?A..?Z

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist()
    |> Enum.map(fn char ->
      cond do
        char in @lowercase ->
          Enum.find_index(@lowercase, &(&1 == char))
          |> (&Enum.at(@lowercase, rem(&1 + shift, 26))).()

        char in @uppercase ->
          Enum.find_index(@uppercase, &(&1 == char))
          |> (&Enum.at(@uppercase, rem(&1 + shift, 26))).()

        true ->
          char
      end
    end)
    |> List.to_string()
  end
end

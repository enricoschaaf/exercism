defmodule SimpleCipher do
  @doc """
  Given a `plaintext` and `key`, encode each character of the `plaintext` by
  shifting it by the corresponding letter in the alphabet shifted by the number
  of letters represented by the `key` character, repeating the `key` if it is
  shorter than the `plaintext`.

  For example, for the letter 'd', the alphabet is rotated to become:

  defghijklmnopqrstuvwxyzabc

  You would encode the `plaintext` by taking the current letter and mapping it
  to the letter in the same position in this rotated alphabet.

  abcdefghijklmnopqrstuvwxyz
  defghijklmnopqrstuvwxyzabc

  "a" becomes "d", "t" becomes "w", etc...

  Each letter in the `plaintext` will be encoded with the alphabet of the `key`
  character in the same position. If the `key` is shorter than the `plaintext`,
  repeat the `key`.

  Example:

  plaintext = "testing"
  key = "abc"

  The key should repeat to become the same length as the text, becoming
  "abcabca". If the key is longer than the text, only use as many letters of it
  as are necessary.
  """
  def encode(plaintext, key) do
    key
    |> cipher()
    |> Stream.cycle()
    |> Enum.zip(to_charlist(plaintext))
    |> Enum.map(fn {r, c} ->
      if c in ?a..?z do
        if c + r <= ?z, do: c + r, else: c + r - ?z + ?a - 1
      else
        c
      end
    end)
    |> to_string()
  end

  @doc """
  Given a `ciphertext` and `key`, decode each character of the `ciphertext` by
  finding the corresponding letter in the alphabet shifted by the number of
  letters represented by the `key` character, repeating the `key` if it is
  shorter than the `ciphertext`.

  The same rules for key length and shifted alphabets apply as in `encode/2`,
  but you will go the opposite way, so "d" becomes "a", "w" becomes "t",
  etc..., depending on how much you shift the alphabet.
  """
  def decode(ciphertext, key) do
    key
    |> cipher()
    |> Stream.cycle()
    |> Enum.zip(to_charlist(ciphertext))
    |> Enum.map(fn {r, c} ->
      if c in ?a..?z do
        if c - r >= ?a, do: c - r, else: c - r + ?z - ?a + 1
      else
        c
      end
    end)
    |> to_string()
  end

  defp cipher(key) do
    key
    |> to_charlist()
    |> Enum.map(&if &1 in ?a..?z, do: &1 - ?a, else: 0)
  end
end

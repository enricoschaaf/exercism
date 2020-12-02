defmodule Atbash do
  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t()) :: String.t()
  def encode(plaintext) do
    plaintext
    |> String.downcase()
    |> String.replace(~r/[^a-z\d]/, "")
    |> String.to_charlist()
    |> Enum.map(fn c ->
      if c in ?a..?z do
        ?z - Enum.find_index(?a..?z, &(c == &1))
      else
        c
      end
    end)
    |> List.to_string()
    |> String.codepoints()
    |> Enum.chunk_every(5)
    |> Enum.map_join(" ", &Enum.join/1)
  end

  @spec decode(String.t()) :: String.t()
  def decode(cipher) do
    cipher
    |> String.replace(" ", "")
    |> String.to_charlist()
    |> Enum.map(fn c ->
      if c in ?a..?z do
        ?a + Enum.find_index(?z..?a, &(c == &1))
      else
        c
      end
    end)
    |> List.to_string()
  end
end

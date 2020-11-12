defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """

  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    try do
      {:ok,
       Enum.map(
         rna
         |> String.codepoints()
         |> Enum.chunk_every(3)
         |> Enum.map(&Enum.join/1)
         |> Enum.take_while(&(&1 not in ["UAA", "UAG", "UGA"])),
         &cond do
           &1 in ["UGU", "UGC"] -> "Cysteine"
           &1 in ["UUA", "UUG"] -> "Leucine"
           &1 in ["AUG"] -> "Methionine"
           &1 in ["UUU", "UUC"] -> "Phenylalanine"
           &1 in ["UCU", "UCC", "UCA", "UCG"] -> "Serine"
           &1 in ["UGG"] -> "Tryptophan"
           &1 in ["UAU", "UAC"] -> "Tyrosine"
           true -> raise("invalid RNA")
         end
       )
       |> Enum.dedup()}
    rescue
      error -> {:error, error.message}
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    case codon do
      "UGU" -> {:ok, "Cysteine"}
      "UGC" -> {:ok, "Cysteine"}
      "UUA" -> {:ok, "Leucine"}
      "UUG" -> {:ok, "Leucine"}
      "AUG" -> {:ok, "Methionine"}
      "UUU" -> {:ok, "Phenylalanine"}
      "UUC" -> {:ok, "Phenylalanine"}
      "UCU" -> {:ok, "Serine"}
      "UCC" -> {:ok, "Serine"}
      "UCA" -> {:ok, "Serine"}
      "UCG" -> {:ok, "Serine"}
      "UGG" -> {:ok, "Tryptophan"}
      "UAU" -> {:ok, "Tyrosine"}
      "UAC" -> {:ok, "Tyrosine"}
      "UAA" -> {:ok, "STOP"}
      "UAG" -> {:ok, "STOP"}
      "UGA" -> {:ok, "STOP"}
      _ -> {:error, "invalid codon"}
    end
  end
end

IO.inspect(ProteinTranslation.of_rna("UUAUGU"))

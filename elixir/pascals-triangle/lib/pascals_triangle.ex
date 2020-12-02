defmodule PascalsTriangle do
  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  """
  @spec rows(integer) :: [[integer]]
  def rows(num, rows \\ [[1]])
  def rows(num, rows) when length(rows) == num, do: rows

  def rows(num, rows) do
    row =
      rows
      |> List.last()
      |> Enum.chunk_every(2, 1, :discard)
      |> Enum.map(&Enum.sum/1)

    rows(num, rows ++ [[1] ++ row ++ [1]])
  end
end

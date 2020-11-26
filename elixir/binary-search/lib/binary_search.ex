defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    numbers |> Tuple.to_list() |> Enum.with_index() |> algorithm(key)
  end

  defp algorithm([], _key) do
    :not_found
  end

  defp algorithm(numbers, key) do
    position = numbers |> length() |> div(2)
    {number, index} = Enum.at(numbers, position)

    cond do
      key == number ->
        {:ok, index}

      key < number ->
        algorithm(Enum.take(numbers, position), key)

      key > number ->
        algorithm(Enum.take(numbers, -position), key)
    end
  end
end

defmodule Garden do
  @children [
    :alice,
    :bob,
    :charlie,
    :david,
    :eve,
    :fred,
    :ginny,
    :harriet,
    :ileana,
    :joseph,
    :kincaid,
    :larry
  ]

  @plants %{"C" => :clover, "G" => :grass, "R" => :radishes, "V" => :violets}
  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @children) do
    info_string
    |> String.split()
    |> Enum.map(fn row ->
      row
      |> String.codepoints()
      |> Enum.map(&@plants[&1])
      |> Enum.chunk_every(2)
    end)
    |> Enum.zip()
    |> Enum.map(fn {[a, b], [c, d]} -> {a, b, c, d} end)
    |> Enum.zip(Enum.sort(student_names))
    |> Enum.into(
      Enum.into(student_names, %{}, &{&1, {}}),
      fn {v, k} -> {k, v} end
    )
  end
end

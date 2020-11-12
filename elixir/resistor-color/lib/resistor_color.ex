defmodule ResistorColor do
  @resistors [
    "black",
    "brown",
    "red",
    "orange",
    "yellow",
    "green",
    "blue",
    "violet",
    "grey",
    "white"
  ]
  @moduledoc false

  @spec colors() :: list(String.t())
  def colors do
    @resistors
  end

  @spec code(String.t()) :: integer()
  def code(color) do
    Enum.find_index(@resistors, &(&1 == color))
  end
end

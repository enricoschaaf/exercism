defmodule Clock do
  defstruct hour: 0, minute: 0

  @doc """
  Returns a clock that can be represented as a string:

      iex> Clock.new(8, 9) |> to_string
      "08:09"
  """
  @spec new(integer, integer) :: Clock
  def new(hour, minute) do
    hour = Enum.at(0..23, rem(hour + div(minute, 60) - if(minute < 0, do: 1, else: 0), 24))
    minute = Enum.at(0..59, rem(minute, 60))

    %Clock{hour: hour, minute: minute}
  end

  @doc """
  Adds two clock times:

      iex> Clock.new(10, 0) |> Clock.add(3) |> to_string
      "10:03"
  """
  @spec add(Clock, integer) :: Clock
  def add(%Clock{hour: hour, minute: minute}, add_minute) do
    new(hour, minute + add_minute)
  end

  defimpl String.Chars, for: Clock do
    def to_string(%Clock{hour: hour, minute: minute}) do
      "#{zp(hour)}:#{zp(minute)}"
    end

    defp zp(number) do
      number |> Integer.to_string() |> String.pad_leading(2, "0")
    end
  end
end

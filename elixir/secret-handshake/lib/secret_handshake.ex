defmodule SecretHandshake do
  alias SecretHandshake

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())

  def commands(code) do
    {[],
     code
     |> Integer.to_string(2)
     |> String.reverse()}
    |> match(0, "wink")
    |> match(1, "double blink")
    |> match(2, "close your eyes")
    |> match(3, "jump")
    |> (&(if String.at(Kernel.elem(&1, 1), 4) == "1" do
            Enum.reverse(Kernel.elem(&1, 0))
          else
            Kernel.elem(&1, 0)
          end)).()
  end

  defp match({operations, reversed_code}, position, operation) do
    if String.at(reversed_code, position) == "1" do
      {operations ++ [operation], reversed_code}
    else
      {operations, reversed_code}
    end
  end
end

SecretHandshake.commands(8)

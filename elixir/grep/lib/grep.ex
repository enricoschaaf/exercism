defmodule Grep do
  @spec grep(String.t(), [String.t()], [String.t()]) :: String.t()
  def grep(pattern, flags, files) do
    files
    |> Enum.flat_map(fn file ->
      File.read!(file)
      |> String.split("\n")
      |> Enum.with_index()
      |> Enum.filter(fn {line, _i} -> i_flag(line, flags, pattern) end)
    end)
    |> n_flag(flags)
  end

  # def grep(pattern, ["-n"] = flags, files) do
  #   files
  #   |> Enum.flat_map(fn file ->
  #     File.read!(file)
  #     |> i_flag(flags)
  #     |> String.split("\n")
  #     |> Enum.with_index()
  #     |> Enum.filter(fn {line, _i} -> String.contains?(line, pattern) end)
  #   end)
  #   |>
  # end

  defp n_flag(lines, flags) do
    if "-n" in flags do
      lines
      |> Enum.map(fn {line, i} -> "#{i + 1}:#{line}" end)
      |> Enum.join("\n")
      |> Kernel.<>("\n")
    else
      lines |> Enum.map(&elem(&1, 0)) |> Enum.join("\n") |> Kernel.<>("\n")
    end
  end

  defp i_flag(line, flags, pattern) do
    if "-i" in flags do
      String.contains?(String.downcase(line), String.downcase(pattern))
    else
      String.contains?(line, pattern)
    end
  end
end

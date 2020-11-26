defmodule Tournament do
  @doc """
  Given `input` lines representing two teams and whether the first of them won,
  lost, or reached a draw, separated by semicolons, calculate the statistics
  for each team's number of games played, won, drawn, lost, and total points
  for the season, and return a nicely-formatted string table.

  A win earns a team 3 points, a draw earns 1 point, and a loss earns nothing.

  Order the outcome by most total points for the season, and settle ties by
  listing the teams in alphabetical order.
  """
  @spec tally(input :: list(String.t())) :: String.t()
  def tally(input) do
    results =
      input
      |> Enum.map(&do_tally/1)
      |> Enum.reduce(fn elem, acc ->
        Map.merge(acc, elem, fn _k, map1, map2 ->
          Map.merge(map1, map2, fn _k, v1, v2 -> v1 + v2 end)
        end)
      end)
      |> Map.to_list()
      |> Enum.sort(fn {first_team, a}, {second_team, b} ->
        points_a = a["w"] * 3 + a["d"]
        points_b = b["w"] * 3 + b["d"]

        cond do
          points_a > points_b ->
            true

          points_a < points_b ->
            false

          points_a == points_b ->
            first_team < second_team
        end
      end)

    """
    #{String.pad_trailing("Team", 31)}| MP |  W |  D |  L |  P
    #{
      results
      |> Enum.map_join("\n", fn {team, results} ->
        "#{String.pad_trailing(team, 31)}|  #{results["w"] + results["l"] + results["d"]} |  #{
          results["w"]
        } |  #{results["d"]} |  #{results["l"]} |  #{results["w"] * 3 + results["d"]}"
      end)
    }
    """
    |> String.trim()
  end

  defp do_tally(game) do
    if String.match?(game, ~r/^(\w+\s\w+;){2}(win|loss|draw)$/) do
      [first_team, second_team, result] = game |> String.split(";")

      case result do
        "win" ->
          %{
            first_team => %{"w" => 1, "l" => 0, "d" => 0},
            second_team => %{"w" => 0, "l" => 1, "d" => 0}
          }

        "loss" ->
          %{
            first_team => %{"w" => 0, "l" => 1, "d" => 0},
            second_team => %{"w" => 1, "l" => 0, "d" => 0}
          }

        "draw" ->
          %{
            first_team => %{"w" => 0, "l" => 0, "d" => 1},
            second_team => %{"w" => 0, "l" => 0, "d" => 1}
          }
      end
    else
      %{}
    end
  end
end

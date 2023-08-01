defmodule RockPaperScissors do
  defp get_score_one([]), do: 0

  defp get_score_one([enemy, player]) do
    <<enemy::utf8>> = enemy
    <<player::utf8>> = player
    enemy = enemy - ?A
    player = player - ?X

    w = rem(player + 2, 3)
    d = rem(player, 3)
    l = rem(player + 1, 3)

    from_result =
      case enemy do
        ^w -> 6
        ^d -> 3
        ^l -> 0
      end

    from_result + player + 1
  end

  defp get_score_two([]), do: 0

  defp get_score_two([enemy, outcome]) do
    <<enemy::utf8>> = enemy
    <<outcome::utf8>> = outcome

    # shift enemy -> player
    shift =
      case outcome do
        ?X -> 2
        ?Y -> 0
        ?Z -> 1
      end

    from_choice = rem(enemy - ?A + shift, 3) + 1
    from_result = (outcome - ?X) * 3

    from_result + from_choice
  end

  defp handle(line, acc, f) do
    line
    |> String.split()
    |> f.()
    |> Kernel.+(acc)
  end

  defp handle_one(line, acc) do
    handle(line, acc, &get_score_one/1)
  end

  defp handle_two(line, acc) do
    handle(line, acc, &get_score_two/1)
  end

  def solve_one(input_name) do
    File.stream!(input_name)
    |> Enum.reduce(0, &handle_one/2)
  end

  def solve_two(input_name) do
    File.stream!(input_name)
    |> Enum.reduce(0, &handle_two/2)
  end
end

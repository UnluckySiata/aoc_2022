defmodule Solutions do
  defp path(filename) do
    "inputs/day#{Integer.to_string(filename)}.txt"
  end

  def solve_1_all do
    CalorieCounting.solve_all(path(1))
  end

  def solve_1_1 do
    CalorieCounting.solve_one(path(1))
  end

  def solve_1_2 do
    CalorieCounting.solve_two(path(1))
  end

  def solve_2_1 do
    RockPaperScissors.solve_one(path(2))
  end

  def solve_2_2 do
    RockPaperScissors.solve_two(path(2))
  end

  def solve_3_1 do
    RucksackReorganization.solve_one(path(3))
  end

  def solve_3_2 do
    RucksackReorganization.solve_two(path(3))
  end

  def solve_4_1 do
    CampCleanup.solve_one(path(4))
  end

  def solve_4_2 do
    CampCleanup.solve_two(path(4))
  end
end

defmodule Solutions do
  defp path(filename) do
    "inputs/" <> filename
  end

  def solve_1_all do
    CalorieCounting.solve_all(path("calories.txt"))
  end

  def solve_1_1 do
    CalorieCounting.solve_one(path("calories.txt"))
  end

  def solve_1_2 do
    CalorieCounting.solve_two(path("calories.txt"))
  end

  def solve_2_1 do
    RockPaperScissors.solve_one(path("rps.txt"))
  end

  def solve_2_2 do
    RockPaperScissors.solve_two(path("rps.txt"))
  end

  def solve_3_1 do
    RucksackReorganization.solve_one(path("rucksack.txt"))
  end

  def solve_3_2 do
    RucksackReorganization.solve_two(path("rucksack.txt"))
  end

  def solve_4_1 do
    CampCleanup.solve_one(path("cleanup.txt"))
  end

  def solve_4_2 do
    CampCleanup.solve_two(path("cleanup.txt"))
  end
end

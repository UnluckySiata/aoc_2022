defmodule CalorieCounting do
  # all elves
  defp handle_all(line, [last | rest]) do
    case Integer.parse(line) do
      {x, _} -> [last + x | rest]
      :error -> [0, last | rest]
    end
  end

  # top 1 elf
  defp handle_one(line, {last, curr_max}) do
    case Integer.parse(line) do
      {x, _} ->
        {last + x, curr_max}

      :error ->
        if last > curr_max do
          {0, last}
        else
          {0, curr_max}
        end
    end
  end

  # top 3 elves
  defp handle_two(line, {last, list}) do
    case Integer.parse(line) do
      {x, _} ->
        {last + x, list}

      :error ->
        new_list =
          [last | list]
          |> Enum.sort(:desc)
          |> Enum.take(3)

        {0, new_list}
    end
  end

  def solve_one(input_file) do
    File.stream!(input_file)
    |> Enum.reduce({0, 0}, &handle_one/2)
    |> elem(1)
  end

  def solve_two(input_file) do
    File.stream!(input_file)
    |> Enum.reduce({0, []}, &handle_two/2)
    |> elem(1)
    |> Enum.sum
  end

  def solve_all(input_file) do
    File.stream!(input_file)
    |> Enum.reduce([0], &handle_all/2)
    |> Enum.sort(:desc)
  end
end

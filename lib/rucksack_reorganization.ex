defmodule RucksackReorganization do
  defp calculate_priority(letter) do
    if letter >= ?a do
      letter - ?a + 1
    else
      letter - ?A + 27
    end
  end

  defp filter_unique(line) do
    line
    |> String.to_charlist()
    |> Enum.uniq()
  end

  defp handle_one("\n", acc), do: acc

  defp handle_one(line, acc) do
    half = div(String.length(line), 2)

    first =
      line
      |> String.slice(0, half)
      |> filter_unique

    second =
      line
      |> String.slice(half, half)
      |> filter_unique

    first
    |> Enum.drop_while(fn a -> !Enum.member?(second, a) end)
    |> hd
    |> calculate_priority
    |> Kernel.+(acc)
  end

  defp handle_two(line, {sum, [first, second, third]}) do
    [first, second, third] =
      [first, second, third]
      |> Enum.map(&filter_unique/1)

    new_sum =
      first
      |> Enum.drop_while(fn a -> !(Enum.member?(second, a) and Enum.member?(third, a)) end)
      |> hd
      |> calculate_priority
      |> Kernel.+(sum)

    {new_sum, [line]}
  end

  defp handle_two(line, {sum, group}) do
    {sum, [line | group]}
  end

  def solve_one(input_file) do
    File.stream!(input_file)
    |> Enum.reduce(0, &handle_one/2)
  end

  def solve_two(input_file) do
    File.stream!(input_file)
    |> Enum.reduce({0, []}, &handle_two/2)
    |> elem(0)
  end
end

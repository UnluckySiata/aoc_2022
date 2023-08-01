defmodule CampCleanup do
  defp containment_score([a, b, x, y]) do
    cond do
      a == x or b == y -> 1
      a > x and b < y -> 1
      x > a and y < b -> 1
      true -> 0
    end
  end

  defp overlapping_score([a, b, x, y]) do
    cond do
      a >= x and y >= a -> 1
      x > a and b >= x -> 1
      true -> 0
    end
  end

  defp handle("\n", acc, _), do: acc

  defp handle(line, acc, f) do
    line
    |> String.split([",", "-"])
    |> Enum.map(fn x -> elem(Integer.parse(x), 0) end)
    |> f.()
    |> Kernel.+(acc)
  end

  defp handle_one(line, acc) do
    handle(line, acc, &containment_score/1)
  end

  defp handle_two(line, acc) do
    handle(line, acc, &overlapping_score/1)
  end

  def solve_one(input_file) do
    File.stream!(input_file)
    |> Enum.reduce(0, &handle_one/2)
  end

  def solve_two(input_file) do
    File.stream!(input_file)
    |> Enum.reduce(0, &handle_two/2)
  end
end

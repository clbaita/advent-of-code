# This could be done better, I am very rusty.
totals = for elf <- File.read!("input.txt") |> String.split("\n\n"),
                    do: String.split(elf, "\n") |> Enum.map(&Integer.parse/1) |> Enum.map(fn {n, _} -> n end) |> Enum.sum()


sorted = Enum.with_index(totals) |> List.keysort(0, :desc)

[top | _] = sorted

IO.inspect(elem(top,0))

sumTopThree = sorted
  |> Enum.take(3)
  |> Enum.map(fn {n, _} -> n end)
  |> Enum.sum()

IO.inspect(sumTopThree)

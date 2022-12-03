elf_list = File.read!("input.txt") |> String.trim() |> String.split("\n\n")

totals = for elf <- elf_list,
  do: String.split(elf, "\n")
  |> Enum.map(&Integer.parse/1)
  |> Enum.map(&elem(&1,0))
  |> Enum.sum()

sorted = Enum.with_index(totals) |> List.keysort(0, :desc)

[top | _] = sorted

IO.inspect(elem(top,0))

sumTopThree = sorted
  |> Enum.take(3)
  |> Enum.map(&elem(&1,0))
  |> Enum.sum()

IO.inspect(sumTopThree)

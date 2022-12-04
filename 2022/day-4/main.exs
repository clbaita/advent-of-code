pairs = File.read!("input.txt") |> String.trim() |> String.split("\n")

complete_overlap = Enum.map(pairs, fn pair ->
  elves = String.split(pair, ",")
  [[s1, f1], [s2, f2]] = Enum.map(elves, fn elf ->
    String.split(elf, "-")
     |> Enum.map(fn a -> elem(Integer.parse(a), 0) end)
  end)
  areas1 = MapSet.new(Enum.to_list(s1..f1))
  areas2 = MapSet.new(Enum.to_list(s2..f2))
  if MapSet.subset?(areas1, areas2) or MapSet.subset?(areas2, areas1), do: 1, else: 0
end) |> Enum.sum()

IO.inspect(complete_overlap)

partial_overlap = Enum.map(pairs, fn pair ->
  elves = String.split(pair, ",")
  [[s1, f1], [s2, f2]] = Enum.map(elves, fn elf ->
    String.split(elf, "-")
     |> Enum.map(fn a -> elem(Integer.parse(a), 0) end)
  end)
  areas1 = MapSet.new(Enum.to_list(s1..f1))
  areas2 = MapSet.new(Enum.to_list(s2..f2))
  if !MapSet.disjoint?(areas1, areas2), do: 1, else: 0
end) |> Enum.sum()

IO.inspect(partial_overlap)

packing_list = File.read!("input.txt") |> String.trim() |> String.split("\n")

alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" |> String.split("", trim: true)

tally1 = Enum.map(packing_list, fn bag ->
  {l1, l2} = String.split_at(bag, (String.length(bag)/2) |> round)
  comp1 = MapSet.new(String.split(l1, "", trim: true ))
  comp2 = MapSet.new(String.split(l2, "", trim: true ))
  MapSet.intersection(comp1, comp2)
    |> MapSet.to_list()
    |> Enum.map(fn p -> (Enum.find_index(alphabet, fn l -> l === p end) + 1) end)
    |> Enum.sum() # Force integer interpretation, there has to be a better way...
end) |> Enum.sum()

IO.puts(tally1)

groups = packing_list |> Enum.chunk_every(3)

tally2 = Enum.map(groups, fn group ->
  [bag1, bag2, bag3] = Enum.map(group, fn g -> MapSet.new(String.split(g, "", trim: true )) end)

  MapSet.intersection(bag1, bag2)
    |> MapSet.intersection(bag3)
    |> MapSet.to_list()
    |> Enum.map(fn p -> (Enum.find_index(alphabet, fn l -> l === p end) + 1) end)
    |> Enum.sum() # Force integer interpretation, there has to be a better way...
end) |> Enum.sum()

IO.puts(tally2)

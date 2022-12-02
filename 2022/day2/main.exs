game_list = File.read!("input.txt") |> String.trim() |> String.split("\n")

winningPlay = %{"A" => "Y", "B" => "Z", "C" => "X"}
matchingPlay = %{"A" => "X", "B" => "Y", "C" => "Z"}
losingPlay = %{"A" => "Z", "B" => "X", "C" => "Y"}

pointScores = %{"X" => 1, "Y" => 2, "Z" => 3}

part1 = Enum.map(game_list, fn game ->
  [op, player] = String.split(game)
  cond do
    winningPlay[op] === player ->
      6 + pointScores[player]
    matchingPlay[op] === player ->
      3 + pointScores[player]
    true ->
      pointScores[player]
  end
end
) |> Enum.sum()

IO.inspect(part1)

part2 = Enum.map(game_list, fn game ->
  [op, player] = String.split(game)
  cond do
    player === "X" ->
      pointScores[losingPlay[op]]
    player === "Y" ->
      3 + pointScores[matchingPlay[op]]
    player === "Z" ->
      6 + pointScores[winningPlay[op]]
  end
end
) |> Enum.sum()

IO.inspect(part2)

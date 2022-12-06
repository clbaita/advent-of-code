defmodule Daysix do
  @moduledoc """
  Documentation for `Daysix`.
  """
  def parse_input do
    File.read!("input.txt") |> String.trim() |> String.graphemes()
  end

  def scan(input, chunk_size) do
    input
    |> Enum.chunk_every(chunk_size, 1, :discard)
    |> Enum.reduce_while(chunk_size, fn chunk, pos ->
      uniq_count = Enum.uniq(chunk) |> Enum.count()

      case uniq_count do
        ^chunk_size -> {:halt, pos}
        _ -> {:cont, pos + 1}
      end
    end)
  end

  def solve(part) do
    input = parse_input()

    case part do
      1 ->
        scan(input, 4)

      2 ->
        scan(input, 14)
    end
  end
end

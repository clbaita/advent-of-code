defmodule DaysixTest do
  use ExUnit.Case
  doctest Daysix

  test "AOC test input" do
    assert Daysix.hello() == :world
  end
end

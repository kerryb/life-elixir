defmodule LifeTest do
  use ExUnit.Case

  describe "Life.tick/1" do
    test "kills a cell with no neighbours" do
      life =
        [{1, 1}]
        |> Life.new()
        |> Life.tick()

      assert MapSet.size(life.cells) == 0
    end

    test "kills cells with one neighbour" do
      life =
        [{1, 1}, {1, 2}]
        |> Life.new()
        |> Life.tick()

      assert MapSet.size(life.cells) == 0
    end

    test "Leaves cells with two neighbours alive" do
      life =
        [{1, 1}, {1, 2}, {1, 3}]
        |> Life.new()
        |> Life.tick()

      assert life.cells == MapSet.new([{1, 2}])
    end
  end
end

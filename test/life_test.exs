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

      assert MapSet.member?(life.cells, {1, 2})
    end

    test "Leaves cells with three neighbours alive" do
      life =
        [{1, 1}, {1, 2}, {1, 3}, {2, 3}]
        |> Life.new()
        |> Life.tick()

      assert MapSet.member?(life.cells, {1, 2})
    end

    test "Kills cells with four neighbours" do
      life =
        [{2, 1}, {2, 3}, {2, 2}, {1, 2}, {3, 2}]
        |> Life.new()
        |> Life.tick()

      refute MapSet.member?(life.cells, {2, 2})
    end

    test "Creates cells in empty spaces with three neighbours" do
      life =
        [{1, 1}, {1, 3}, {2, 2}]
        |> Life.new()
        |> Life.tick()

      assert MapSet.member?(life.cells, {1, 2})
    end
  end
end

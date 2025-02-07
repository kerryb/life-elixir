defmodule Life.NeighboursTest do
  alias Life.Neighbours
  use ExUnit.Case, async: true

  describe "Life.Neioghbours.find/1" do
    test "returns all coordinates one away in all directions" do
      assert Enum.sort(Neighbours.find({10, 20})) == [
               {9, 19},
               {9, 20},
               {9, 21},
               {10, 19},
               {10, 21},
               {11, 19},
               {11, 20},
               {11, 21}
             ]
    end
  end
end

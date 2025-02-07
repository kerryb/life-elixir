defmodule Life.GridTest do
  alias Life.Grid
  use ExUnit.Case

  describe "Life.Grid.new/1" do
    test "converts a list of cells to a two-dimensional array just covering all cells" do
      life = Life.new([{3, 3}, {5, 2}, {2, 5}])

      assert life |> Grid.new() == [
               [false, false, false, true],
               [false, true, false, false],
               [false, false, false, false],
               [true, false, false, false]
             ]
    end
  end

  describe "Life.Grid.to_string/1" do
    test "renders an ascii representation of a two-dimensional array of booleans" do
      life = Life.new([{3, 3}, {5, 2}, {2, 5}])

      assert life |> Grid.new() |> Grid.to_string("*", ".") == """
             ...*
             .*..
             ....
             *...
             """
    end
  end
end

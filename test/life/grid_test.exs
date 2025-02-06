defmodule Life.GridTest do
  alias Life.Grid
  use ExUnit.Case

  describe "Life.Grid.render/1" do
    test "displays a game within the bounds of live cells" do
      life = Life.new([{3, 3}, {5, 2}, {2, 5}])

      assert life |> Grid.render() |> String.replace(" ", ".") == """
             ...◼︎
             .◼︎..
             ....
             ◼︎...
             """
    end
  end
end

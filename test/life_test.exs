defmodule LifeTest do
  use ExUnit.Case

  describe "Life.tick/1" do
    test "kills a cell with no neighbours" do
      life = Life.new([{1, 1}])
      assert MapSet.size(Life.tick(life).cells) == 0
    end
  end
end

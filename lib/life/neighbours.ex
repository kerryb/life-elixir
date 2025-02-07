defmodule Life.Neighbours do
  @moduledoc """
  Utility functions to find neighbours.

  Extracted from the top-level module to avoid exposing a public function
  purely to allow unit testing.
  """

  @doc """
  Find the coordinates of potential neighbours of a cell.
  """
  def find({x, y}) do
    for x2 <- (x - 1)..(x + 1), y2 <- (y - 1)..(y + 1), {x, y} != {x2, y2}, do: {x2, y2}
  end
end

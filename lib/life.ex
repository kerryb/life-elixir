defmodule Life do
  @enforce_keys [:cells]
  defstruct [:cells]

  def new(cells) do
    %__MODULE__{cells: MapSet.new(cells)}
  end

  def tick(life) do
    Map.update!(life, :cells, fn cells -> MapSet.filter(cells, &keep_alive?(&1, life.cells)) end)
  end

  defp keep_alive?(cell, cells) do
    length(neighbours(cell, cells)) == 2
  end

  defp neighbours(cell, cells) do
    Enum.filter(cells, &(&1 in neighbouring_coordinates(cell)))
  end

  defp neighbouring_coordinates({x, y}) do
    [
      {x - 1, y - 1},
      {x, y - 1},
      {x + 1, y - 1},
      {x - 1, y},
      {x + 1, y},
      {x - 1, y + 1},
      {x, y + 1},
      {x + 1, y + 1}
    ]
  end
end

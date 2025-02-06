defmodule Life do
  @enforce_keys [:cells]
  defstruct [:cells]

  def new(cells) do
    %__MODULE__{cells: MapSet.new(cells)}
  end

  def tick(life) do
    Map.update!(life, :cells, &update_cells/1)
  end

  defp update_cells(cells) do
    MapSet.union(remaining_cells(cells), create_new_cells(cells))
  end

  defp remaining_cells(cells) do
    MapSet.filter(cells, &keep_alive?(&1, cells))
  end

  defp keep_alive?(cell, cells) do
    length(neighbours(cell, cells)) in [2, 3]
  end

  defp create_new_cells(cells) do
    cells
    |> Enum.flat_map(&neighbouring_coordinates/1)
    |> Enum.group_by(& &1)
    |> Map.filter(fn {_coordinates, cells} -> length(cells) == 3 end)
    |> Map.keys()
    |> MapSet.new()
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

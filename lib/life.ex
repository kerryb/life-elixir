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
    |> all_locations_with_cell_neighbours()
    |> count_neighbours()
    |> cells_to_create()
    |> MapSet.new()
  end

  defp neighbours(cell, cells) do
    Enum.filter(cells, &(&1 in neighbouring_coordinates(cell)))
  end

  defp all_locations_with_cell_neighbours(cells) do
    Enum.flat_map(cells, &neighbouring_coordinates/1)
  end

  defp count_neighbours(locations) do
    Enum.reduce(locations, %{}, fn cell, counts -> Map.update(counts, cell, 1, &(&1 + 1)) end)
  end

  defp cells_to_create(locations_with_counts) do
    Enum.flat_map(locations_with_counts, fn
      {cell, 3} -> [cell]
      _ -> []
    end)
  end

  def neighbouring_coordinates({x, y}) do
    for x2 <- (x - 1)..(x + 1), y2 <- (y - 1)..(y + 1), {x, y} != {x2, y2} do
      {x2, y2}
    end
  end
end

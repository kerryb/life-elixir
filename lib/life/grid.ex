defmodule Life.Grid do
  def new(life) do
    to_grid(life.cells, min_max_x(life.cells), min_max_y(life.cells))
  end

  defp min_max_x(cells) do
    cells |> Enum.min_max_by(&elem(&1, 0)) |> then(fn {{min, _}, {max, _}} -> {min, max} end)
  end

  defp min_max_y(cells) do
    cells |> Enum.min_max_by(&elem(&1, 1)) |> then(fn {{_, min}, {_, max}} -> {min, max} end)
  end

  defp to_grid(cells, {min_x, max_x}, {min_y, max_y}) do
    Enum.map(min_y..max_y, &to_row(cells, &1, min_x, max_x))
  end

  defp to_row(cells, y, min_x, max_x) do
    Enum.map(min_x..max_x, &MapSet.member?(cells, {&1, y}))
  end

  def to_string(grid, cell_marker, blank_marker) do
    Enum.map_join(grid, "\n", &render_row(&1, cell_marker, blank_marker)) <> "\n"
  end

  defp render_row(row, cell_marker, blank_marker) do
    Enum.map_join(row, &render_point(&1, cell_marker, blank_marker))
  end

  defp render_point(true, cell_marker, _blank_marker) do
    cell_marker
  end

  defp render_point(false, _cell_marker, blank_marker) do
    blank_marker
  end
end

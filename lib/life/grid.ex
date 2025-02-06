defmodule Life.Grid do
  def render(life) do
    render_grid(life.cells, min_max_x(life.cells), min_max_y(life.cells))
  end

  defp min_max_x(cells) do
    cells |> Enum.min_max_by(&elem(&1, 0)) |> then(fn {{min, _}, {max, _}} -> {min, max} end)
  end

  defp min_max_y(cells) do
    cells |> Enum.min_max_by(&elem(&1, 1)) |> then(fn {{_, min}, {_, max}} -> {min, max} end)
  end

  defp render_grid(cells, {min_x, max_x}, {min_y, max_y}) do
    Enum.map_join(min_y..max_y, "\n", &render_row(cells, &1, min_x, max_x)) <> "\n"
  end

  defp render_row(cells, y, min_x, max_x) do
    Enum.map_join(min_x..max_x, &render_coordinate(cells, &1, y))
  end

  defp render_coordinate(cells, x, y) do
    character_for(MapSet.member?(cells, {x, y}))
  end

  defp character_for(true) do
    "◼︎"
  end

  defp character_for(false) do
    " "
  end
end

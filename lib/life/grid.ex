defmodule Life.Grid do
  def render(life) do
    {{min_x, _}, {max_x, _}} = Enum.min_max_by(life.cells, &elem(&1, 0))
    {{_, min_y}, {_, max_y}} = Enum.min_max_by(life.cells, &elem(&1, 1))
    render_grid(life, min_x, max_x, min_y, max_y)
  end

  defp render_grid(life, min_x, max_x, min_y, max_y) do
    Enum.map_join(min_y..max_y, "\n",  &render_row(life, &1, min_x, max_x)) <> "\n"
  end

  defp render_row(life, y, min_x, max_x) do
    Enum.map_join(min_x..max_x, &render_coordinate(life, &1, y))
  end

  defp render_coordinate(life, x, y) do
    if MapSet.member?(life.cells, {x, y}) do
      "◼︎"
    else
      " "
      end
  end
end

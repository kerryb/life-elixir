defmodule Life do
  @survival_neighbour_counts [2, 3]
  @birth_neighbour_count 3

  @moduledoc """
  The core implementation of the game.

  Models living cells as a set of `{x, y}` coordinates.
  """
  alias Life.Neighbours
  @enforce_keys [:cells]
  defstruct [:cells]

  @doc """
  Create a new `Life` struct with the cells provided.
  """
  def new(cells) do
    %__MODULE__{cells: MapSet.new(cells)}
  end

  @doc """
  Run one iteration of life, and return a new struct with the updated state of
  the universe.
  """
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
    length(neighbours(cell, cells)) in @survival_neighbour_counts
  end

  defp create_new_cells(cells) do
    cells |> locations_with_neighbours() |> Enum.frequencies() |> cells_to_create()
  end

  defp neighbours(cell, cells) do
    Enum.filter(cells, &(&1 in Neighbours.find(cell)))
  end

  defp locations_with_neighbours(cells) do
    Enum.flat_map(cells, &Neighbours.find/1)
  end

  defp cells_to_create(locations_with_counts) do
    Enum.filter(locations_with_counts, &new_cell_born?/1) |> MapSet.new(&elem(&1, 0))
  end

  defp new_cell_born?({_cell, count}) do
    count == @birth_neighbour_count
  end
end

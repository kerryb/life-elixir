defmodule Runner do
  alias Life.Grid

  def run do
    1..100
    |> Enum.map(fn _ -> {:rand.uniform(20), :rand.uniform(20)} end)
    |> Life.new()
    |> run_until_stable()
  end

  defp run_until_stable(old_generation) do
    new_generation = Life.tick(old_generation)

    if new_generation != old_generation do
      IEx.Helpers.clear()
      IO.puts(Grid.render(new_generation))
      Process.sleep(100)
      run_until_stable(new_generation)
    end
  end
end

Runner.run()

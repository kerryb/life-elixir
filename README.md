# Life

An implementation of [Conway’s Game of
Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) in
[Elixir](https://elixir-lang.org/). Partially written during a [Code
Retreat](https://www.coderetreat.org/) I was facilitating, but not within the
“throw your code away after 45 minutes rule!

Models the universe as a set of cells (`{x, y}` tuples), rather than a grid.

## Run the tests:

```
mix test
```

## Command line runner

This starts with a random set of cells, and runs until the state becomes static
or, more likely until you get bored. Shows just enough grid to include all
current cells, so will probably get bigger as it runs – you might want to
reduce your terminal font size!

```
mix run runner.exs
```

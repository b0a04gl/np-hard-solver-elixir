defmodule Genetic do
  alias Types.Chromosome

  def initialize(genotype, opts \\ []) do
    population_size = Keyword.get(opts, :population_size, 100)
    for _ <- 1..population_size, do: genotype.()
  end

def run(problem, opts \\ []) do
    population = initialize(&problem.genotype/0)
    population
    |> evolve(problem, 0, opts)

  end

  def evaluate(population, fitness_function, opts \\ []) do
      population
    |> Enum.map(
        fn chromosome ->
          fitness = fitness_function.(chromosome)
          age = chromosome.age + 1
          %Chromosome{chromosome | fitness: fitness, age: age}
          end
      )
    |> Enum.sort_by(fitness_function, &>=/2)
  end

  def select(population, opts \\ []) do
    select_fn = Keyword.get(opts, :selection_type, &Tools.Selection.elite/2)
    select_rate =   Keyword.get(opts, :selection_rate, 0.8)

     n = round(length(population) * select_rate)
    n = if rem(n, 2) == 0, do: n, else: n+1

    parents =
      select_fn
      |> apply([population, n])

      leftover = MapSet.difference(MapSet.new(population), MapSet.new(parents))

  parents =
      parents
      |> Enum.chunk_every(2)
      |> Enum.map(& List.to_tuple(&1))

      {parents, MapSet.to_list(leftover)}
  end

  def evolve(population, problem, generation, opts \\ []) do
    population = evaluate(population, &problem.fitness_function/1, opts)
    best = hd(population)
    IO.write("\rCurrent optimal : #{best.fitness}")
    if problem.terminate?(population, generation) do
      best
    else
      {parents, leftover} = select(population, opts)
      |> evolve(problem, generation+1, opts)
    end
  end


end

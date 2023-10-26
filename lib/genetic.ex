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

  def evolve(population, problem, generation, opts \\ []) do
    population = evaluate(population, &problem.fitness_function/1, opts)
    best = hd(population)
    IO.write("\rCurrent optimal : #{best.fitness}")

  end


end

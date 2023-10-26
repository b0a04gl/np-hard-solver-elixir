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
    IO.write("\rCurrent best: #{best.fitness}")
    if problem.terminate?(population, generation) do
      best
    else
      {parents, leftover} = select(population, opts)
      children = crossover(parents, opts)
        children ++ leftover
      |> mutation(opts)
      |> evolve(problem, generation+1, opts)
    end
  end


  def crossover(population, opts \\ []) do
    population
    |> Enum.reduce([],
        fn {p1, p2}, acc ->
          cx_point = :rand.uniform(length(p1.genes))
          {{head1, tail1}, {head2, tail2}} = {Enum.split(p1.genes, cx_point), Enum.split(p2.genes, cx_point)}
          {c1, c2} = {%Chromosome{genes: head1 ++ tail2}, %Chromosome{genes: head2 ++ tail1}}
          [c1 | [c2 | acc]]
        end
      )
  end

  def mutation(population, opts \\ []) do
    population
    |> Enum.map(
        fn chromosome ->
            if :rand.uniform() < 0.05 do
            %Chromosome{genes: Enum.shuffle(chromosome.genes)}
        else
        chromosome
          end
        end
      )
  end

end

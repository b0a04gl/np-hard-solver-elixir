defmodule GeneticTest do
  use ExUnit.Case
  alias Types.Chromosome

  describe "initialize/1" do
  test "initializes a population of the specified size" do
    genotype = fn -> %Chromosome{genes: [1, 2, 3, 4, 5, 6, 7, 8], size: 8} end
    population_size = 50

    population = Genetic.initialize(genotype, [population_size: 50])

    assert length(population) == population_size
  end
  end

  describe "evaluate/2" do
    test "evaluates the fitness of a population" do
      fitness_function = fn %{genes: genes} -> length(genes) end
      chromosome1 = %Chromosome{genes: [1, 2, 3, 4], size: 4}
      chromosome2 = %Chromosome{genes: [1, 2, 3, 4, 5], size: 5}
      population = [chromosome1, chromosome2]

      evaluated_population = Genetic.evaluate(population, fitness_function)

      assert Enum.sort_by(evaluated_population, &(&1.fitness)) == [%Chromosome{genes: [1, 2, 3, 4], size: 4 , age: 1, fitness: 4},%Chromosome{genes: [1, 2, 3, 4, 5], size: 5 , age: 1, fitness: 5}]

    end
  end

  describe "select/2" do
    test "selects parents from a population" do
      fitness_function = fn %{genes: genes, size: size} -> {genes, size} end
      chromosome1 = %Chromosome{genes: [1, 2, 3, 4], size: 4, fitness: 0, age: 0}
      chromosome2 = %Chromosome{genes: [1, 2, 3, 4, 5], size: 5, fitness: 0, age: 0}
      population = [chromosome1, chromosome2]

      {parents, _leftover} = Genetic.select(population)

      assert parents == [{chromosome1, chromosome2}]
    end

  end

end

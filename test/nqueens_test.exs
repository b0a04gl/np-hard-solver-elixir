defmodule NQueensTest do
  use ExUnit.Case

  alias NQueens, as: NQueens
  alias Types.Chromosome

  test "genotype returns a chromosome with shuffled genes" do
    chromosome = NQueens.genotype()

    assert is_map(chromosome)
    assert is_list(chromosome.genes)
    assert length(chromosome.genes) == 8
    assert Enum.uniq(chromosome.genes) == chromosome.genes
  end

  test "fitness_function returns a valid fitness score for a chromosome" do
    chromosome = %Chromosome{genes: [0, 1, 2, 3, 4, 5, 6, 7]}

    fitness = NQueens.fitness_function(chromosome)

    # Calculate the expected fitness for this specific chromosome (replace with the actual expected value)
    expected_fitness = -48
    assert fitness == expected_fitness
  end

  test "terminate? returns true when a solution is found" do
    population = [
      %Chromosome{genes: [0, 1, 2, 3, 4, 5, 6, 7, 8], fitness: 8},
      %Chromosome{genes: [4, 5, 1, 6, 0, 7, 3, 8, 2], fitness: 8}
    ]

    result = NQueens.terminate?(population, 0)

    assert result == true
  end
  
end

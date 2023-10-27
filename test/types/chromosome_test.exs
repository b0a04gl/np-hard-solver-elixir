defmodule Types.ChromosomeTest do
  use ExUnit.Case

  test "struct with defaults" do
    chromosome = %Types.Chromosome{genes: []}
    assert %Types.Chromosome{genes: [], size: 0, fitness: 0, age: 0} == chromosome
  end

  test "create chromosome with specific values" do
    chromosome = %Types.Chromosome{genes: [1, 2, 3], size: 3, fitness: 42, age: 5}
    assert %Types.Chromosome{genes: [1, 2, 3], size: 3, fitness: 42, age: 5} == chromosome
  end


  test "type specification" do
    chromosome = %Types.Chromosome{genes: [1, 2, 3], size: 3, fitness: 42, age: 5}
    assert is_map(chromosome) # It's a map
    assert is_integer(chromosome.size)
    assert is_integer(chromosome.fitness)
    assert is_integer(chromosome.age)
  end
end

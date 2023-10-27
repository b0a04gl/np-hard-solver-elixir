defmodule Tools.CrossoverTest do
  use ExUnit.Case
  alias Types.Chromosome
  alias Tools.Crossover

  test "single point crossover" do
    p1 = %Chromosome{genes: [1, 2, 3, 4, 5, 6, 7, 8], size: 8}
    p2 = %Chromosome{genes: [8, 7, 6, 5, 4, 3, 2, 1], size: 8}

    {c1, c2} = Crossover.single_point(p1, p2)

    assert length(c1.genes) == 8
    assert length(c2.genes) == 8

    IO.inspect(c1)
    IO.inspect(c2)

  end

end

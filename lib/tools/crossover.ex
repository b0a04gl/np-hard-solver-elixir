defmodule Tools.Crossover do
  alias Types.Chromosome

  def single_point(p1, p2) do
    cx_point = :rand.uniform(p1.size)
    {p1_head, p1_tail} = Enum.split(p1.genes, cx_point)
    {p2_head, p2_tail} = Enum.split(p2.genes, cx_point)
    {c1, c2} = {p1_head ++ p2_tail, p2_head ++ p1_tail}

    {%Chromosome{genes: c1, size: length(c1)},
      %Chromosome{genes: c2, size: length(c2)}}
  end

end

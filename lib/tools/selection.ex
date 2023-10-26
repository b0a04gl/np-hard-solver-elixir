defmodule Tools.Selection do

  def elite(population, n) do
    population
    |> Enum.take(n)
  end

end

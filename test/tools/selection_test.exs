defmodule Tools.SelectionTest do
  use ExUnit.Case

  test "selects the elite from a population" do
    population = [%{fitness: 10}, %{fitness: 5}, %{fitness: 8}, %{fitness: 12}, %{fitness: 9}]
    n = 3

    sorted_population = Enum.sort_by(population, &Map.get(&1, :fitness), &>=/2)
    elite_population = Tools.Selection.elite(sorted_population, n)

    assert length(elite_population) == n
    assert elite_population == [%{fitness: 12}, %{fitness: 10}, %{fitness: 9}]
  end
end

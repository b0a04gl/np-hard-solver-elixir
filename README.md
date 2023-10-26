
# GeneticSolverElixir: Unleashing the Power of Genetic Algorithms on NP-Hard Problems

Solving the NP Hard problems such as N-Queens puzzle is like deciphering a complex code, and it gets even trickier with larger chessboards. Traditional methods, such as brute force and backtracking, soon stumble when the board size (N) becomes substantial. Genetic algorithms, however, unleash a new era of efficiency. They dance through the solution space with elegance, making them the ideal choice for the N-Queens challenge.

## High level gist of Genetic Algorithm to arrive at optimalism

Genetic algorithms are like playing cards. You start with five cards (chromosomes), each representing a potential solution. Just like in a card game, you decide which cards (solutions) to keep or discard in each round (generation). This process evolves your hand (population) over multiple rounds to find the best solution. It's evolution in action, but with playing cards! Finally who has max worth card wins (optimal solution)
![Alt text](<Screenshot 2023-10-26 at 10.33.27 PM.png>)

Yep you guessed right, it's merely an abstraction over human genetics.(It's quite interesting if you get chance, give it a shot..)

## A Practical Example
Let's take the N-Queens puzzle as an example. Even though there are alternative methods to solve it, like brute-force search or constraint propagation, GAs stand out.

A brute-force approach quickly becomes impractical as the board size increases. Constraint propagation, while more efficient, might not guarantee the optimal solution. On the other hand, GAs take advantage of parallelism, adapt to various board sizes, and tackle the N-Queens puzzle efficiently.

## The Efficiency Combo: Genetic Algorithms in Elixir
The combination of Genetic Algorithms and Elixir's strengths ensures efficient problem-solving. Elixir's concurrency and fault tolerance, paired with GAs, give us the upper hand when tackling NP-Hard problems.

Yep.. while alternatives exist, the efficiency, adaptability, and parallel processing capabilities of Genetic Algorithms in Elixir make it the choice for solving NP-Hard problems with style.
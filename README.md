# # Evolve Shakeaspeare

Genetic Algorithm build to solve the "to be or not to be" challenge in LOVE2D.

# # How it works

The target is the phrase "to be or not to be", so we build a population of random phrases and keep evolving them until eventually we get to the target phrase, the basics steps are:

- Build the population
- Then on training phase we repeat the steps:
    - Generate a pool of phrases based on previous score
    - CrossOver the population within itself
    - Mutate the population based on a rate
    - Calculate the fitness for each one
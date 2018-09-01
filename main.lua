
function love.load(arg)
  require("util")
  require("model")
  best_index = 1
  best_score = 0
  population_n = 1000
  dna_n = 18
  population, count = generatePopulation(population_n, dna_n)
  bigfont = love.graphics.newFont(40)
  myfont = love.graphics.newFont(10)
  gameover = false
end

function love.update(dt)


    pool = generatePool(population)

    crossOver(pool, population, dna_n)

    mutate(population, 50)

    for i = #population, 1, -1 do
      fitness(population[i], target_t)
      if population[i].score > best_score then
        best_index = i
        best_score = population[i].score
      end
    end
end

function love.draw()
  -- body...
  love.graphics.setFont(bigfont)
  love.graphics.print("Best answer ", 100, 0)
  love.graphics.print("Target ", 100, 50)
  printWord(population[best_index].chain, 400, 0)
  printWord(target_t, 400, 50)

  love.graphics.setFont(myfont)
  for i = 50, 1, -1 do
    printWord(population[i].chain, 0, i*10)
  end
end

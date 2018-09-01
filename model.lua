target = "to be or not to be"
target_t = {}
for i = 1, #target do
  target_t[i] = target:sub(i,i)
end

function generatePopulation(population_n, dna_n)
  population = {}
  for i = 1, population_n do
    dna = {}
    dna.chain = {}
    for i = 1, dna_n, 1 do
      table.insert(dna.chain, randomChar())
    end
    dna.score = 1
    table.insert(population, dna)
  end
  return population
end

function fitness(dna, target)
  score = 0
  for i = 1, #dna.chain, 1 do
    if dna.chain[i] == target[i] then
      score = score + 1
    end
  end
  dna.score = score/#target
end

function generatePool(population)
  local pool = {}
  for i, dna in ipairs(population) do
    local p = dna.score * 100
    for j = 1, p do
      table.insert(pool, dna)
    end
  end
  return pool
end

function crossOver(pool, population, dna_n)
  love.math.setRandomSeed(love.math.random(1000))
  for i = 1, #population do
    midpoint = love.math.random(dna_n)
    parentA = love.math.random(#pool)
    parentB = love.math.random(#pool)
    for j = #population[i].chain, 1, -1 do
      if j >= midpoint then
        population[i].chain[j] = pool[parentB].chain[j]
      else
        population[i].chain[j] = pool[parentA].chain[j]
      end
    end
  end
end

function mutate(population, rate)
  love.math.setRandomSeed(love.math.random(1000))
  for i, dna in ipairs(population) do
    for i, g in ipairs(dna.chain) do
      rand = love.math.random(100)
      if rand <= rate then
        g = randomChar()
      end
    end
  end
end

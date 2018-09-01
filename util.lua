
Keys = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r",
"s", "t", "u", "v", "x", "z", " "}

function randomChar()
  local index = love.math.random(#Keys)
  return Keys[index]
end

function printWord(dna, x, y)
  love.graphics.print(dna,x, y)
end

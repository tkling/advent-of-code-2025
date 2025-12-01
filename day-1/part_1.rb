directional_mods = {
  "R" => 1,
  "L" => -1
}

MIN = 0
MAX = 99
WIDTH = MAX - MIN + 1

current = 50
times_landed_on_zero = 0

commands = File.read("input.txt").split("\n").map do
  {
    direction: _1[0],
    clicks: _1[1..].to_i
  }
end

# current = 2
# command = L8 (8 clicks left)
# 1 1, 2 0, 3 99, 4 98, 5 97, 6 96, 7 95, 8 94
# 2 - 8 = -6; WIDTH - 6 = 94
#
# current = 99
# command = R4 (4 clicks right)
# 1 0, 2 1, 3 2, 4 3
# 99 + 4 = 103

puts "The dial starts by pointing at #{current}."

commands.each do |command|
  dir = command[:direction]
  clicks = command[:clicks]

  dir_mod = directional_mods[dir]
  reduced_clicks = (clicks * dir_mod) % (WIDTH * dir_mod)
  new_i = current + reduced_clicks

  if new_i < MIN 
    new_i = WIDTH - new_i.abs
  elsif new_i > MAX
    new_i = new_i % WIDTH
  end

  current = new_i 

  times_landed_on_zero += 1 if current == 0
  puts "The dial is rotated #{dir}#{clicks} to point at #{current}."
end

puts "Total times pointed to zero: #{times_landed_on_zero}."


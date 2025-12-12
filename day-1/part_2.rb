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
    raw: _1,
    direction: _1[0],
    clicks: _1[1..].to_i
  }
end

puts "The dial starts by pointing at #{current}"

commands.each do |command|
  dir = command[:direction]
  clicks = command[:clicks]
  dir_mod = directional_mods[dir]

  clicks.times do
    current += dir_mod

    if current == 0
      times_landed_on_zero += 1
      puts "LANDED on ZERO!"
    elsif current < MIN
      current = MAX
    elsif current > MAX
      current = MIN
      times_landed_on_zero += 1
    end
  end

  puts "The dial is rotated #{dir}#{clicks} to point at #{current}"
end

puts "Times landed on zero: #{times_landed_on_zero}"

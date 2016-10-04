puts "\nQuestion 1\n"
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages
puts ages.fetch("Spot", false) ? "He's #{ages["Spot"]}!" : "He's not here."
puts ages.has_key?("Spot") ? "He's #{ages["Spot"]}!" : "He's not here."
puts ages.include?("Spot") ? "He's #{ages["Spot"]}!" : "He's not here."
puts ages.key?("Spot") ? "He's #{ages["Spot"]}!" : "He's not here."
puts ages.member?("Spot") ? "He's #{ages["Spot"]}!" : "He's not here."

puts "\nQuestion 2\n"
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p ages
total = 0
ages.each_value { |value| total += value }
puts total
puts ages.values.inject(:+)

puts "\nQuestion 3\n"
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages
ages.delete_if { |_, value| value >= 100 }
p ages
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.keep_if { |_, value| value < 100 }
p ages

puts "\nQuestion 4\n"
munsters_description = "The Munsters are creepy in a good way."
puts munsters_description
munsters_description.capitalize!
puts munsters_description
munsters_description = "The Munsters are creepy in a good way."
munsters_description.swapcase!
puts munsters_description
munsters_description = "The Munsters are creepy in a good way."
munsters_description.downcase!
puts munsters_description
munsters_description = "The Munsters are creepy in a good way."
munsters_description.upcase!
puts munsters_description

puts "\nQuestion 5\n"
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
p ages
p additional_ages
ages.merge!(additional_ages)
p ages

puts "\nQuestion 6\n"
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p ages
minimum = ages.values[0]
ages.each_value { |age| age < minimum ? minimum = age : minimum = minimum }
puts minimum
puts ages.values.min

puts "\nQuestion 7\n"
advice = "Few things in life are as important as house training your pet dinosaur."
puts advice
puts advice.include?("Dino") ? "It's in there." : "It's not in there."
puts advice.match("Dino") ? "It's in there." : "It's not in there."

puts"\nQuestion 8\n"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones
puts flintstones.index { |name| name[0, 2] == "Be"}
puts flintstones.index { |name| name.start_with?("Be") }

puts "\nQuestion 9\n"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones
flintstones.map! do |name|
  name[0, 3]
end
p flintstones

puts "\nQuestion 10\n"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones
flintstones.map! { |name| name[0, 3]}
p flintstones

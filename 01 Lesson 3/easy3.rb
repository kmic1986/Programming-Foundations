puts "\nQuestion 1\n"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones

puts "\nQuestion 2\n"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones
flintstones << "Dino"
p flintstones
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push("Dino")
p flintstones

puts "\nQuestion 3\n"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones
flintstones.concat(%w(Dino Hoppy))
p flintstones
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push("Dino").push("Hoppy")
p flintstones

puts "\nQuestion 4\n"
advice = "Few things in life are as important as house training your pet dinosaur."
puts advice
puts advice.slice!(0,39)
puts advice
advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.slice(0,39)
puts advice
puts advice.slice!(0, advice.index('house'))
puts advice

puts "\nQuestion 5\n"
statement = "The Flintstones Rock!"
puts statement.count("t")
puts statement.scan("t").count

puts "\nQuestion 6\n"
title = "Flintstone Family Members"
puts title
puts title.center(40, "*")

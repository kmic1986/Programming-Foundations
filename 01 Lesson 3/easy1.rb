puts "\nQuestion 1\n"
numbers = [1, 2, 2, 3]
numbers.uniq
puts numbers

puts "\nQuestion 2\n"
puts "'!' is used to denote 'not' or, sometimes when"
puts "at the end of a method name, to denote a mutative"
puts "method- but not always! '?' is used in the ternary"
puts "operator, and sometimes at the end of a method name,"
puts "denotes a method that tests a condition - but not"
puts "always!\n"
puts "'!=' is used to test 'not equal to' in a conditional"
puts "statement."
puts "'!' before something would mean the opposite of its"
puts "boolean value."
puts "'!' after something can denote a mutative method - but"
puts "not always!"
puts "'?' before something is referring to the ternary"
puts "operator '? :', used as a simple, one-line if-else"
puts "statement."
puts "'?' after something can denote a method that tests"
puts "a condition - but not always!"
puts "'!!' before something turns an object into it's"
puts "boolean equivalent."

puts "\nQuestion 3\n"
advice = "Few things in life are as important" +
         " as house training your pet dinosaur."
puts advice
advice.gsub!('important', 'urgent')
puts advice

puts "\nQuestion 4\n"
numbers = [1, 2, 3, 4, 5]
p numbers
numbers.delete_at(1)
p numbers
numbers = [1, 2, 3, 4, 5]
numbers.delete(1)
p numbers

puts"\nQuestion 5\n"
puts (10..100).cover?(42) ? "42 is between 10 and 100!" : "42 is not between 10 and 100!"

puts "\nQuestion 6\n"
famous_words = "seven years ago..."
puts famous_words
famous_words = "Four score and " << famous_words
puts famous_words
famous_words = "seven years ago..."
famous_words.prepend("Four score and ")
puts famous_words

puts "\nQuestion 7\n"
def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

puts eval(how_deep)

puts "\nQuestion 8\n"
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
p flintstones
flintstones.flatten!
p flintstones

puts "\nQuestion 9\n"
flintstones = { "Fred" => 0, "Wilma" => 1,  "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
p flintstones
flintstones = flintstones.assoc("Barney")
p flintstones

puts "\nQuestion 10\n"
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
p flintstones
flintstones_hash = {}
flintstones.each_with_index do |key, value|
  flintstones_hash[key] = value
end
p flintstones_hash

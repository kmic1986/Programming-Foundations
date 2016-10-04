puts "\nQuestion 1\n"
10.times { |spaces| puts (" " * spaces) + "The Flintstones Rock!" }

puts "\nQuestion 2\n"
statement = "The Flintstones Rock"
puts statement
hash = {}
statement.each_char do |chr|
  if hash.include?(chr)
    hash[chr] += 1
  else
    hash[chr] = 1
  end
end
p hash
hash = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  hash[letter] = letter_frequency if letter_frequency > 0
end
p hash

puts "\nQuestion 3\n"
puts "This is because you can't concatenate a string"
puts "with an integer. You can use '\#{}' to insert"
puts "the addition or convert it to a string with '.to_s'"
puts "the value of 40 + 2 is #{40 + 2}"
puts "the value of 40 + 2 is " + (40 + 2).to_s

puts "\nQuestion 4\n"
puts "If you modify the length of the array during"
puts "iteration, it will change the number of total iterations"
puts "each time it goes through one...iteration."
puts "With '.shift' it will happen to the first"
puts "number in the array..."
numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "n[#{index}] #{numbers.inspect} => #{number}"
  numbers.shift(1)
end
puts "...and with '.pop' it will happen to the last."
numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "n[#{index}] #{numbers.inspect} => #{number}"
  numbers.pop(1)
end

puts "\nQuestion 5\n"
def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end
p factors(20)
puts "The 'number % dividend == 0' checks to see"
puts "if the number is a factor, ie. divides evenly"
puts "with no remainder. Putting 'divisors' before"
puts "the end of the method makes the method return"
puts "divisors, so that when it's called it does something"
puts "externally useful."

puts "\nQuestion 6\n"
puts "Yes, '<<' is mutative and '+' is not! '<<' will"
puts "alter the buffer variable from inside the method, while"
puts "'+' only concatenate to the buffer variable inside"
puts "the method. The first method doesn't need to return"
puts "the buffer variable, it's already been altered. The"
puts "second one returns a new value that will have to be"
puts "set to the outer scope buffer method."

puts "\nQuestion 7\n"
puts "The 'limit' variable is out of scope; it can't be"
puts "reached from inside the method. I'd try passing"
puts "it as an argument to the method; it seems like"
puts "something you'd want to alter on a call-by-call basis."

def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, 15)
puts "result is #{result}"

puts "\nQuestion 8\n"
def titleize(string)
  string.split(' ').map! { |word| word.capitalize }.join(' ')
end

puts titleize("thIs Was ALL messed uP a MinUTe aGO!")

puts "\nQuestion 9\n"
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
p munsters

munsters.each_value do |info|
  case info["age"]
  when 0..18
    info["age_group"] = "kid"
  when 18..65
    info["age_group"] = "adult"
  else
    info["age_group"] = "senior"
  end
end

p munsters

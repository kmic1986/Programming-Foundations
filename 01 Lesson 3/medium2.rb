puts "\n************Question 1************"
puts ""

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}
puts munsters
total = 0

munsters.each_pair do |key, value|
  if value["gender"] == "male"
    total += value["age"]
  end
end

puts total


puts "\n************Question 2************"
puts ""

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
puts munsters

munsters.each_pair { |name, info| puts "#{name} is a #{info["age"]} year old #{info["gender"]}." }

puts "\n************Question 3************"
puts ""

puts "You can make it so that both parameters are altered"
puts "with either a mutative or non-mutative operation."
puts "They should be given the same treatment, whichever"
puts "is more appropriate (probably non-mutative, '+=')."
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

puts "\n************Question 4************"
puts ""

sentence = "Humpty Dumpty sat on a wall."
puts sentence
sentence = sentence.split(" ").reverse.join(" ")
puts sentence
sentence = "Humpty Dumpty sat on a wall."
sentence = sentence.split(/\W/).reverse.join(" ") + "."
puts sentence

puts "\n************Question 5************"
puts ""

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

puts "\n************Question 6************"
puts ""

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
p munsters

puts "The method variable is pointing to the location of"
puts "the local variable and is never reassigned before"
puts "it is altered. What's done to the method variable"
puts "is also altering the local variable outside the method."
def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)
p munsters

puts "\n************Question 7************"
puts ""

def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

puts "\n************Question 8************"
puts ""

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

puts bar(foo)

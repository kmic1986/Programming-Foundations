puts "\n************Question 1************"
puts ""

if false
  greeting = “hello world”
end

p greeting

puts "It will return nil. The if conditional evaluates to false,"
puts "meaning the code inside of it never runs. 'greeting' is"
puts "never assigned. But, it is declared. When a variable is"
puts "declared inside of an 'if' block and the block evaluates"
puts "to false, it is set to nil."

puts "\n************Question 2************"
puts ""

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

puts "The '<<' operation is mutative, meaning that when you perform"
puts "it on a variable pointing to a shared address, the other variable"
puts "is also changed, as it relies upon the information at that address"
puts "and it is being changed."

puts "\n************Question 3************"
puts ""

def mess_with_vars1(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars1(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

def mess_with_vars2(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars2(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

def mess_with_vars3(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars3(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

puts "\n************Question 4************"
puts ""

def get_uuid()
  array = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx".split('')
  num = Random.new()
  array.map! do |c|
    c == "x" ? num.rand(16).to_s(16) : c
  end
  puts array.join('')
end

get_uuid

puts "\n************Question 5************"
puts ""

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false if !is_an_ip_number?(word)
  end
  true
end

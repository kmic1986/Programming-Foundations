# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
end

def operation_to_message(op)
  case op
  when '1'
    MESSAGES[LANGUAGE]['add']
  when '2'
    MESSAGES[LANGUAGE]['subtract']
  when '3'
    MESSAGES[LANGUAGE]['multiply']
  when '4'
    MESSAGES[LANGUAGE]['divide']
  end
end

prompt MESSAGES[LANGUAGE]['welcome']

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt MESSAGES[LANGUAGE]['invalid_name']
  else
    break
  end
end

prompt MESSAGES[LANGUAGE]['greeting'] + name

loop do # main loop
  number1 = ''
  loop do
    prompt MESSAGES[LANGUAGE]['first_number']
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt MESSAGES[LANGUAGE]['invalid_number']
    end
  end

  number2 = ''
  loop do
    prompt MESSAGES[LANGUAGE]['second_number']
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt MESSAGES[LANGUAGE]['invalid_number']
    end
  end

  operator_prompt = MESSAGES[LANGUAGE]['weird_message']
  prompt(operator_prompt)

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt MESSAGES[LANGUAGE]['invalid_operator']
    end
  end

  prompt "#{operation_to_message(operator)}" + MESSAGES[LANGUAGE]['thinking']
  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  prompt MESSAGES[LANGUAGE]['here_it_is'] + "#{result}"

  prompt MESSAGES[LANGUAGE]['go_again']
  answer = gets.chomp
  break unless answer.downcase.start_with?(MESSAGES[LANGUAGE]['letter'])
end

prompt MESSAGES[LANGUAGE]['goodbye']

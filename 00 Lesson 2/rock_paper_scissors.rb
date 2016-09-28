# ****ROCK, PAPER, SCISSORS, LIZARD, SPOCK******

# ******************CONSTANTS********************
VALID_CHOICES = %w(rock paper scissors lizard Spock)
ABBREVIATED_CHOICES = %w(r p s l S)

# *******************METHODS*********************
def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'paper' && second == 'Spock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'lizard' && second == 'Spock') ||
    (first == 'Spock' && second == 'rock') ||
    (first == 'Spock' && second == 'scissors')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def convert_to_valid(abbreviated)
  VALID_CHOICES[ABBREVIATED_CHOICES.index(abbreviated)]
end

def increment_score(player, computer, s)
  if win?(player, computer)
    s[:player] += 1
  elsif win?(computer, player)
    s[:computer] += 1
  end
  s
end

def winner?(s)
  if s.value?(5)
    true
  else
    false
  end
end

def display_winner(s)
  puts ''
  if s[:player] == 5
    prompt("#{s[:player]} to #{s[:computer]}, you win the game!")
  else
    prompt("#{s[:computer]} to #{s[:player]}, computer wins the game!")
  end
end

# *******************WELCOME*********************
puts ''
prompt("Welcome to Rock, Paper, Scissors, Lizard, Spock!")
prompt("First to 5 Wins!")

score = { player: 0, computer: 0 }

# ******************GAME LOOP********************
loop do

  choice = ''
  loop do
    puts ''
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    prompt("(Or just the first letter: #{ABBREVIATED_CHOICES.join(', ')})")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    elsif ABBREVIATED_CHOICES.include?(choice)
      choice = convert_to_valid(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}. Computer chose: #{computer_choice}.")
  display_results(choice, computer_choice)
  score = increment_score(choice, computer_choice, score)

  if winner?(score)
    display_winner(score)
    break
  else
    puts ''
    prompt("The score is #{score[:player]} to #{score[:computer]}.")
    prompt("Next round!")
  end

end

prompt("Thank you for playing. Good bye!")

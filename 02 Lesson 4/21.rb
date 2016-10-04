GAME_NUMBER = 21
DEALER_STAY = 17

# *******************METHODS*******************
def initialize_deck
  suits = ["hearts", "clubs", "diamonds", "spades"]
  values = ["Ace", "2", "3", "4", "5", "6", "7",
            "8", "9", "10", "Jack", "Queen", "King"]
  deck = []
  suits.each do |suit|
    values.each do |value|
      points = get_face_value(value)
      deck << [value, suit, points]
    end
  end
  deck
end

def s_puts(message)
  system "cls"
  puts "\n"
  puts "Welcome to Twenty-One!".center(80)
  puts "\n"
  puts message
end

def get_face_value(value)
  if value.to_i.nonzero?
    value.to_i
  elsif value == "Ace"
    1
  else
    10
  end
end

def initial_deal(deck, p_cards, d_cards)
  2.times do
    deal_card(deck, p_cards)
  end
  2.times do
    deal_card(deck, d_cards)
  end
end

def deal_card(deck, hand)
  card = deck.sample
  hand << card
  deck.slice!(deck.index(card))
end

def player_turn(deck, p_cards, d_cards, total)
  loop do
    break if busted?(p_cards)
    puts "\n"
    puts "Would you like to hit or stay?"
    hit_or_stay = gets.chomp.downcase[0]
    if hit_or_stay == 's'
      break
    elsif hit_or_stay == 'h'
      deal_card(deck, p_cards)
    else
      puts "Try again!"
      sleep(1)
    end
    view_hand(p_cards, d_cards, total)
  end
end

def view_hand(p_cards, d_cards, total)
  s_puts "Dealer(#{total[0]}): #{d_cards[0][2]}        " +
         "Player(#{total[1]}): #{score(p_cards)}".center(80)
  puts "\n"
  puts "\nDealer has:\n\t    #{d_cards[0][0]} of #{d_cards[0][1]} showing"
  puts "\n"
  show_all_cards("Player", p_cards)
end

def show_all_cards(name, hand)
  puts "#{name} has: "
  hand.each_index do |idx|
    puts "\t    #{hand[idx][0]} of #{hand[idx][1]}"
  end
end

def reveal(p_cards, d_cards, total)
  s_puts "Dealer(#{total[0]}): #{score(d_cards)}        " +
         "Player(#{total[1]}): #{score(p_cards)}".center(80)
  puts "\n"
  show_all_cards("Dealer", d_cards)
  puts "\n"
  show_all_cards("Player", p_cards)
end

def busted?(hand)
  score(hand) > GAME_NUMBER
end

def dealer_turn(deck, d_cards)
  loop do
    if score(d_cards) < DEALER_STAY
      deal_card(deck, d_cards)
    else
      break
    end
  end
end

def score(hand)
  h_score = 0
  hand.each { |card| h_score += card[2] }
  hand.each do |card|
    if card[2] == 1 && h_score < 12
      h_score += 10
    end
  end
  h_score
end

def winner?(p_cards, d_cards, total)
  reveal(p_cards, d_cards, total)
  if score(d_cards) > GAME_NUMBER
    puts "\nDealer busted! You win!"
    total[1] += 1
  elsif score(d_cards) > score(p_cards)
    puts "\nDealer wins!"
    total[0] += 1
  elsif score(d_cards) == score(p_cards)
    puts "\nTie! House advantage: dealer wins!"
    total[0] += 1
  else
    puts "\nYou win!"
    total[1] += 1
  end
  sleep(2)
  total
end

# ******************GAME LOOP******************

total = [0, 0]
loop do
  s_puts ""
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  initial_deal(deck, player_cards, dealer_cards)
  view_hand(player_cards, dealer_cards, total)
  player_turn(deck, player_cards, dealer_cards, total)

  if busted?(player_cards)
    reveal(player_cards, dealer_cards, total)
    total[0] += 1
    puts "\nBusted! Dealer wins!"
    sleep(2)
  else
    dealer_turn(deck, dealer_cards)
    total = winner?(player_cards, dealer_cards, total)
    reveal(player_cards, dealer_cards, total)
  end

  break if total.include?(5)
end

if total[0] == 5
  puts "\nGame over! Dealer wins!"
else
  puts "\nGame over! You win!"
end

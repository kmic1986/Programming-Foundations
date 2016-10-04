# *****************CONSTANTS*****************
INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_PATTERNS = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                    [1, 4, 7], [2, 5, 8], [3, 6, 9],
                    [1, 5, 9], [3, 5, 7]].freeze
WHO_GOES_FIRST = "Choose".freeze

# ******************METHODS*******************

def c_puts(string)
  puts string.center(80)
end

# rubocop:disable Metrics/AbcSize
def display_board(board_state, msg)
  system "cls"
  puts "\n"
  c_puts msg
  puts "\n"
  c_puts "   |   |   "
  c_puts " #{board_state[1]} | #{board_state[2]} | #{board_state[3]} "
  c_puts "___|___|___"
  c_puts "   |   |   "
  c_puts " #{board_state[4]} | #{board_state[5]} | #{board_state[6]} "
  c_puts "___|___|___"
  c_puts "   |   |   "
  c_puts " #{board_state[7]} | #{board_state[8]} | #{board_state[9]} "
  c_puts "   |   |   "
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def player_places_piece(bs)
  display_board(bs, "Choose a square (#{joiner(empty_squares(bs))}):")
  square = gets.chomp.to_i
  while !empty_squares(bs).include?(square)
    display_board(bs, "Try again! (#{joiner(empty_squares(bs))})")
    square = gets.chomp.to_i
  end
  bs[square] = PLAYER_MARKER
end

def squares_at_risk?(bs)
  WINNING_PATTERNS.each do |line|
    if bs.keys.select { |num| bs[num] == PLAYER_MARKER }.include?(line[0]) &&
       bs.keys.select { |num| bs[num] == PLAYER_MARKER }.include?(line[1]) &&
       empty_squares(bs).include?(line[2])
      bs[line[2]] = COMPUTER_MARKER
      return true
    elsif bs.keys.select { |num| bs[num] == PLAYER_MARKER }.include?(line[1]) &&
          bs.keys.select { |num| bs[num] == PLAYER_MARKER }.include?(line[2]) &&
          empty_squares(bs).include?(line[0])
      bs[line[0]] = COMPUTER_MARKER
      return true
    end
  end
  false
end

def squares_to_gain?(bs)
  WINNING_PATTERNS.each do |line|
    if bs.keys.select { |num| bs[num] == COMPUTER_MARKER }.include?(line[0]) &&
       bs.keys.select { |num| bs[num] == COMPUTER_MARKER }.include?(line[1]) &&
       empty_squares(bs).include?(line[2])
      bs[line[2]] = COMPUTER_MARKER
      return true
    elsif bs.keys.select { |num| bs[num] == COMPUTER_MARKER }.include?(line[1]) &&
          bs.keys.select { |num| bs[num] == COMPUTER_MARKER }.include?(line[2]) &&
          empty_squares(bs).include?(line[0])
      bs[line[0]] = COMPUTER_MARKER
      return true
    elsif bs.keys.select { |num| bs[num] == COMPUTER_MARKER }.include?(line[0]) &&
          bs.keys.select { |num| bs[num] == COMPUTER_MARKER }.include?(line[2]) &&
          empty_squares(bs).include?(line[1])
      bs[line[1]] = COMPUTER_MARKER
      return true
    end
  end
  false
end

def computer_places_piece(bs)
  if squares_to_gain?(bs)
    return
  elsif squares_at_risk?(bs)
    return
  elsif empty_squares(bs).include?(5)
    bs[5] = COMPUTER_MARKER
  else
    bs[empty_squares(bs).sample] = COMPUTER_MARKER
  end
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def tie?(brd)
  if empty_squares(brd).empty?
    display_board(brd, "It's a tie!")
    sleep(2)
    true
  else
    false
  end
end

def win?(brd, scr)
  WINNING_PATTERNS.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      display_board(brd, "One point for the player!")
      scr["Player"] += 1
      sleep(2)
      return true
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      display_board(brd, "One point for the computer!")
      scr["Computer"] += 1
      sleep(2)
      return true
    end
  end
  false
end

def joiner(spaces, delimiter=', ', word=' or ')
  case spaces.length
  when 1
    spaces[0].to_s
  when 2
    spaces.join(word)
  else
    spaces[0, spaces.length - 1].join(delimiter) + word + spaces[-1].to_s
  end
end

def turn_select(board)
  display_board(board, "Who would you like to go first? (Player or Computer)")
  loop do
    t = gets.chomp.downcase[0]
    if t == "p"
      return "Player"
    elsif t == "c"
      return "Computer"
    else
      display_board(board, "Try again! (Player or Computer)")
    end
  end
end

def take_turn(brd, turn)
  if turn == "Player"
    player_places_piece(brd)
  else
    computer_places_piece(brd)
  end
end

def alternate_player(turn)
  if turn == "Player"
    "Computer"
  else
    "Player"
  end
end

def play_game(score, board=initialize_board)
  turn = WHO_GOES_FIRST
  turn = turn_select(board) if turn == "Choose"

  loop do
    take_turn(board, turn)
    turn = alternate_player(turn)
    break if tie?(board) || win?(board, score)
  end

  if score.value?(5)
    display_board(board, "#{score.key(5)} wins the game!")
  else
    play_game(score)
  end
end

score = { "Player" => 0, "Computer" => 0 }
board = initialize_board
display_board(board, "Welcome to Tic Tac Toe! First to 5 wins!")
sleep(2)
play_game(score, board)
c_puts "Thanks for playing!"

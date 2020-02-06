require 'pry'

# 1. Display the initial empty 3x3 board.
# 2. Ask the user to mark a square.
# 3. Computer marks a square.
# 4. Display the updated board state.
# 5. If winner, display winner.
# 6. If board is full, display tie.
# 7. If neither winner nor board is full, go to #2
# 8. Play again?
# 9. If yes, go to #1
# 10. Good bye!

WINNING_CONDITIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                     [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                     [[1, 5, 9], [3, 5, 7]] # diags
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_SCORE = 5
WHO_FIRST = 'choose'


scoreboard = { player: 0, 
              computer: 0
}

def scoreboard_counter(winner, scoreboard)
  if winner == 'player'
    scoreboard[:player] += 1
  elsif winner == 'computer'
    scoreboard[:computer] += 1
  end
end 

def display_scoreboard(scoreboard)
  "*** Player score: #{scoreboard[:player]} Computer score: #{scoreboard[:computer]} ***"
end 

def match_ended?(scoreboard)
  scoreboard[:player] == WINNING_SCORE || scoreboard[:computer] == WINNING_SCORE
end

def check_for_grandwinner(scoreboard)
  if scoreboard[:player] == WINNING_SCORE
    prompt("You're the GRAND WINNER! Resetting the scoreboard...")
  elsif scoreboard[:computer] == WINNING_SCORE
    prompt("Computer is the GRAND WINNER! Resetting the scoreboard...")
  end
end

def reset_scoreboard(scoreboard)
  scoreboard[:player] = 0 && scoreboard[:computer] = 0
end

def prompt(msg)
  puts "=> #{msg}"
end

def intro
  prompt "Welcome Tic-Tac-Toe!"
  puts ''
  prompt "THE RULES:"
  puts "Select a square by choosing a number from the options available"
  prompt "EXAMPLE:"
  puts "     |     |"
  puts "  1  |  2  |   3"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  4  |  5  |   6  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  7  |  8  |   9"
  puts "     |     |"
  puts ""
  prompt "Your marker is 'X'. The computer's marker is 'O'."
  puts "The object of the game is to get 3 of your markers in a line. 
This line can be in a row, column or diagnoal."
  puts ''
  prompt "Ready to play? Let's go!"
end

# rubocop:disable Metics/AbcSize
def display_board(brd)
  system 'clear'
  puts "Tic-Tac-Toe!"
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metics/AbcSize

def decide_who_goes_first
  if WHO_FIRST == 'player'
    'player'
  elsif WHO_FIRST == 'computer'
    'computer'
  elsif WHO_FIRST == 'choose'
    puts "You get to decide who goes first! Type 1 for player and 2 for computer:"
    loop do
      answer = gets.chomp
      if answer == '1'
        return 'player'
      elsif answer == '2'
        return 'computer'
      else 
        puts "That's not a valid choice. Try again."
      end
    end
  end
end

def joinor(arr, div=', ', word='or ')
  if arr.length < 2
     arr
  elsif arr.length == 2
        arr.join('or ' || "#{word}")
  else
    arr[-1] = "#{word}" + "#{arr.last}."
    arr.join(div)
  end
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_spaces(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_pieces(brd)
  answer = ''

  loop do
    prompt "Choose a square, (#{joinor(empty_spaces(brd))})"
    answer = gets.chomp.to_i
    break if empty_spaces(brd).include?(answer)
    prompt "Sorry, that's not a valid choice."
  end
  brd[answer] = PLAYER_MARKER
end

def defensive_move(brd)
  WINNING_CONDITIONS.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2
      return brd.select { |k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
    end
  end
  nil
end

def offensive_move(brd)
  WINNING_CONDITIONS.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2
      return brd.select { |k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
    end
  end
  nil
end

def computer_places_piece(brd)
  square = nil
  
  if !!offensive_move(brd)
    square = offensive_move(brd)
  elsif !!defensive_move(brd)
    square = defensive_move(brd)
  elsif brd[5] == ' '
    square = 5
  else
    square = empty_spaces(brd).sample
  end
  
  brd[square] = COMPUTER_MARKER
end

def move(player, brd)
  if player == 'player'
    player_places_pieces(brd)
  elsif player == 'computer'
    computer_places_piece(brd)
  end
end

def next_player_turn(current_player)
  if current_player == 'computer'
    'player'
  elsif current_player == 'player'
    'computer'
  end
end


def board_full(brd)
  empty_spaces(brd) == []
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_CONDITIONS.each do |line|
    if brd.values_at(*line).all?(PLAYER_MARKER)
      return 'player'
    elsif brd.values_at(*line).all?(COMPUTER_MARKER)
      return 'computer'
    end
  end
  nil
end

def display_game_result(winner)
  if winner == 'player'
    prompt "Player won!"
  elsif winner == 'computer'
    prompt "Computer won!"
  else
    prompt "It's a tie!"
  end
end

loop do
  intro
  current_player = decide_who_goes_first
  loop do
    board = initialize_board
    
    loop do
      display_board(board)
      prompt display_scoreboard(scoreboard)
      move(current_player, board)
      current_player = next_player_turn(current_player)
      break if someone_won?(board) || board_full(board)
    end
    
    display_board(board)
    
    winner = detect_winner(board)
    
    scoreboard_counter(detect_winner(board), scoreboard)
    
    display_game_result(winner)
    
    sleep(2)

    
    if match_ended?(scoreboard)
      check_for_grandwinner(scoreboard)
      display_scoreboard(scoreboard)
      break
    end
  end
  
  prompt "Want to play again? y for yes, n for no:"
  answer = gets.chomp
  break if answer.downcase != 'y'
  
  reset_scoreboard(scoreboard)
end

prompt "Thanks for playing!"

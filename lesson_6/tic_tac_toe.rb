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

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def intro
  prompt "Tic-Tac-Toe!"
end

def display_board(brd)
  system 'clear'
  intro
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

def initialize_board 
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER}
  new_board
end

def empty_spaces(brd)
  brd.keys.select {|num| brd[num] == INITIAL_MARKER}
end

def player_places_pieces(brd)
  answer = ''
  
  loop do 
    prompt "Choose a square, (#{empty_spaces(brd).join(', ')})"
    answer = gets.chomp.to_i
    break if empty_spaces(brd).include?(answer)
    prompt "Sorry, that's not a valid choice."
  end
    brd[answer] = PLAYER_MARKER
end 

def computer_places_piece(brd)
  answer = empty_spaces(brd).sample
  brd[answer] = COMPUTER_MARKER
end

def board_full(brd)
  empty_spaces(brd) == []
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  winning_conditions = [[1,2,3],[4,5,6],[7,8,9]] + #rows
                       [[1,4,7],[2,5,8],[3,6,9]] + #cols
                       [[1,5,9],[3,5,7]]  #diags
                       
  winning_conditions.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER 
       return 'Player'
    elsif brd[line[0]] == COMPUTER_MARKER &&
          brd[line[1]] == COMPUTER_MARKER &&
          brd[line[2]] == COMPUTER_MARKER
          return 'Computer'
    end
  end
  nil
end

loop do
board = initialize_board
display_board(board)
loop do
  player_places_pieces(board)
  computer_places_piece(board)
  display_board(board)
  break if someone_won?(board) || board_full(board)
end

if someone_won?(board)
  prompt "#{detect_winner(board)} won!"
else
  prompt "It's a tie!"
end

prompt "Want to play again? y for yes, n for no:"
answer = gets.chomp
break if answer.downcase != 'y'
prompt "Thanks for playing!"
end

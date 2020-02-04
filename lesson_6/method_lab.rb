require 'pry'

board = {1=>'X', 2=> ' ', 3=> ' ', 4=> 'X', 5=> ' ', 6=> ' ', 7=> 'O', 8=> 'O', 9=> ' '}
WINNING_CONDITIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                     [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                     [[1, 5, 9], [3, 5, 7]] # diags
COMPUTER_MARKER = 'O'
PLAYER_MARKER = 'X'
INITIAL_MARKER = ' '

def defensive_move(brd)
  
  square = WINNING_CONDITIONS.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2
      return brd.select { |k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
    end
  end
  square
end


def offensive_move(brd)
  
  square = WINNING_CONDITIONS.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2
      return brd.select { |k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
    end
  end
  square
end

p (offensive_move(board))
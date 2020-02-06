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

def move(player, brd)
  if player == 'player'
    player_places_pieces(brd)
  elsif player == 'computer'
    computer_places_piece(brd)
  end
end

def next_player_turn(current_player)
  if current_player == 'computer'
    return 'player'
  elsif player == 'player'
    return 'computer'
  end
end

# determine player 
# player moves 
# next player places piece 
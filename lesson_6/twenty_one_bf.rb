require 'pry'

WINNING_CONDITION = 21
DEALERS_LIMIT = 17

deck = { 'Hearts': ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 'Jack', 'Queen', 'King'],
         'Spades': ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 'Jack', 'Queen', 'King'],
         'Diamonds': ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 'Jack', 'Queen', 'King'],
         'Clubs': ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 'Jack', 'Queen', 'King'] }

def deal_card(deck, hand)
  suit = deck.keys.sample
  hand << [suit, deck[suit].sample]
end

def deal_intitial_cards(deck, p_hand, d_hand)
  2.times do
    deal_card(deck, p_hand)
    deal_card(deck, d_hand)
  end
end

def display_p_hand(p_hand)
  puts "\nYour cards: #{joinor(p_hand)}."
  puts "Total: #{calculate_total(p_hand)}"
end

def display_d_hand(d_hand)
  puts "\nThe dealer has #{d_hand[0][1]} and an unknown card."
end

def joinor(arr, dev=', ', word=' and ')
  values = []
  arr.each do |sub_arr|
    values << sub_arr.last
  end

  if values.length == 2
    return values.join(word.to_s)
  elsif values.length > 2
    return values[0...-1].join(dev) + word.to_s + values.last.to_s
  end
end

def calculate_total(hand)
  total = 0
  # calculate total
  hand.each do |card|
    value = card.last
    total += if value == 'Ace'
               11
             elsif value.to_i == 0
               10
             else
               value
             end
  end

  # calculate number of aces
  hand.flatten.count('Ace').times do
    total -= 10 if total > WINNING_CONDITION
  end
  # return total
  total
end

def players_turn(deck, players_hand, p_total)
  loop do
    display_p_hand(players_hand)
    sleep(2)
    puts "\nHit or stick?"
    answer = gets.chomp
    deal_card(deck, players_hand) if answer.downcase == "hit"
    p_total = calculate_total(players_hand)
    break if answer == "stick" || busted?(p_total)
  end
  
  if busted?(p_total)
    puts "\nBusted!"
    puts "Your hand: #{p_total}. Dealer Wins!"
  else
    "You stayed!"
  end
end

def dealers_turn(deck, dealers_hand, d_total)
  loop do
    break if d_total > DEALERS_LIMIT || busted?(d_total)
    deal_card(deck, dealers_hand)
    d_total = calculate_total(dealers_hand)
    sleep(1)
    puts "\nDealer hits!"
  end
  
  if busted?(d_total)
    sleep(1)
    puts "\nDealer busted! You won!"
  else
    sleep(1)
    puts "\nDealer sticks!"
  end
end

def busted?(total)
  total > WINNING_CONDITION
end

def result(p_total, d_total)
  if busted?(p_total)
    :dealer
  elsif busted?(d_total)
    :player
  elsif p_total == d_total
    :tie
  elsif p_total > d_total
    :player
  elsif d_total > p_total
    :dealer
  end
end 

def display_results(p_total, d_total)
  puts "\nPlayer's Hand: #{p_total}"
  puts "Dealer's Hand: #{d_total}"
end

def display_winner(p_total, d_total)
  winner = result(p_total, d_total)
  puts "\nThe winner of this round is #{winner.to_s}." 
end

def display_scoreboard(scoreboard)
  puts "\n************************"
  puts "*** PLAYER SCORE = #{scoreboard[:player]} ***"
  puts "*** DEALER SCORE = #{scoreboard[:dealer]} ***"
  puts "******* TIES = #{scoreboard[:tie]} ******"
  puts "************************"
end

def update_scoreboard(scoreboard, p_total, d_total)
  winner = result(p_total, d_total)
  scoreboard[winner] += 1
end

def game_ended(scoreboard)
  scoreboard.any? {|k,v| v == 5}
end

def display_grandwinner(scoreboard)
  if scoreboard[:player] == 5
    puts "\nPLAYER is the GRANDWINNER!"
  elsif scoreboard[:dealer] == 5
    puts "\nDEALER is the GRANDWINNER!"
  elsif scoreboard[:tie] == 5
    puts "\nIT'S A DRAW! TIE FOR GRANDWINNER"
  end
end

def intro
  puts "INTRO RULES"
end

loop do
  intro
  sleep(1)
  system 'clear'
  
  scoreboard = {:player => 0,
                :dealer => 0,
                :tie => 0
  }

  loop do
    players_hand = []
    dealers_hand = []

    deal_intitial_cards(deck, players_hand, dealers_hand)
    players_total = calculate_total(players_hand)
    dealers_total = calculate_total(dealers_hand)
    display_d_hand(dealers_hand)
    
    # Players turn
    puts "\nPlayer's turn:"
    players_turn(deck, players_hand, players_total)
    players_total = calculate_total(players_hand)
    
    # Dealers turn
    if !busted?(players_total)
        dealers_total = calculate_total(dealers_hand)
        puts "\nDealer's turn:"
        sleep(2)
        dealers_turn(deck, dealers_hand, dealers_total)
    end
    dealers_total = calculate_total(dealers_hand)
    # update results
    
    result(players_total, dealers_total)
    sleep(2)
    system 'clear'
    display_results(players_total, dealers_total)
    display_winner(players_total, dealers_total)
    update_scoreboard(scoreboard, players_total, dealers_total)
    display_scoreboard(scoreboard)
    sleep(4)
    system 'clear'
    if !!game_ended(scoreboard)
      display_grandwinner(scoreboard)
      break
    end
  end

  sleep(2)
  puts "\nWould you like to play again? y for yes, n for no."
  answer = gets.chomp
  if answer.downcase == 'n'
    break
  end
end
system 'clear'
sleep(1)
puts "Thanks for playing Twenty One!"
sleep(2)

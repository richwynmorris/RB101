require 'pry'

WINNING_CONDITION = 21

deck = {'Hearts': ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 'Jack', 'Queen', 'King'],
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
  puts "The dealer has #{d_hand[0][1]} and an unknown card."
end

def joinor(arr, dev=', ', word='and ')
    values = []
    arr.each do |sub_arr|
      values << sub_arr.last
    end
      return values.join(" #{word}")
end


def calculate_total(hand)
total = 0
# calculate total
hand.each do |card|
  if card.last == 'King'
      total += 10  
  elsif card.last == 'Queen'
      total += 10 
  elsif card.last == 'Jack'
      total += 10
  elsif card.last == 'Ace'
      total += 11
  else
      total += card.last
  end
end
# calculate number of aces 
hand.flatten.count('Ace').times do
  total -= 10 if total > WINNING_CONDITION
end
# return total  
total
end

def hit_or_stick_player(deck, players_hand)
  loop do 
    display_p_hand(players_hand)
    sleep(2)
    puts "\nHit or stick?"
    answer = gets.chomp
    break if answer.downcase == "stick"
    if answer.downcase == "hit"
      deal_card(deck, players_hand)
    break if !!busted?(players_hand)
    else
      puts "You need to select a valid option"
    end
  end
end


def hit_or_stick_dealer(deck, dealers_hand)
  loop do 
    if calculate_total(dealers_hand) < 17
      deal_card(deck, dealers_hand)
      sleep(1)
      puts "\nDealer hits!"
    break if !!busted?(dealers_hand)
    elsif calculate_total(dealers_hand) >= 17
      sleep(1)
      puts "\nDealer sticks!"
      break
    end
  end
end

def busted?(hand)
  calculate_total(hand) > WINNING_CONDITION
end

def compare_cards(p_hand, d_hand)
  if calculate_total(p_hand) && calculate_total(d_hand) < WINNING_CONDITION
    if calculate_total(p_hand) > calculate_total(d_hand)
      puts "\nPlayer wins!"
    elsif calculate_total(d_hand) > calculate_total(p_hand)
      puts "\nDealer wins!"
    elsif calculate_total(p_hand) == calculate_total(d_hand)
      puts "\nIt's a tie!"
    end
  end
end

def display_results(p_hand, d_hand)
  puts "\nPlayer's Hand: #{calculate_total(p_hand)}"
  puts "Dealer's Hand: #{calculate_total(d_hand)}"
end


loop do 
sleep(1)
system 'clear'

players_hand = []
dealers_hand = []
  
deal_intitial_cards(deck, players_hand, dealers_hand)

display_d_hand(dealers_hand)  

  loop do
    puts "\nPlayer's turn:" 
    hit_or_stick_player(deck, players_hand)
    if !!busted?(players_hand)
      puts "\nBusted! Your hand was #{calculate_total(players_hand)}. Dealer Wins!"
    break
    end
  
    puts "\nDealer's turn:"
    sleep(2)
    hit_or_stick_dealer(deck, dealers_hand)
    if !!busted?(dealers_hand)
      puts "\nDealer Busted! Dealer's hand was #{calculate_total(dealers_hand)}. Player Wins!" 
    break
    end
  
  compare_cards(players_hand, dealers_hand)
  
  sleep(2)

  display_results(players_hand, dealers_hand)
  
  break
  end
  
sleep(2)
puts "\nWould you like to play again? y for yes, n for no."
answer = gets.chomp
if answer.downcase == 'n'
break
end
end
system 'clear'
sleep(2)
puts "Thanks for playing!"
sleep(2)
VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']
VALID_CHOICES_ABRV = ['r', 'p', 'sc', 'sp', 'l']

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  winning_combintaions = {
    rock:['lizard', 'scissors'],
    paper:['rock', 'spock'],
    scissors:['paper', 'lizard'],
    spock:['rock', 'scissors'],
    lizard:['spock', 'paper'],
  }
    
  winning_combintaions[first.to_sym].include?(second)
end

def assign_abrv_choice(input)
  choice = {
    r: 'rock',
    p: 'paper',
    sc: 'scissors',
    sp: 'spock',
    l: 'lizard',
  }
  choice[input.to_sym]
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

computer_wins = 0
player_wins = 0

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}.")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    elsif VALID_CHOICES_ABRV.include?(choice)
      choice = assign_abrv_choice(choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}.")
  
  display_results(choice, computer_choice)
  
  if win?(choice, computer_choice)
    player_wins += 1
  elsif
    computer_wins += 1
  end
    
  prompt("The computer's score is #{computer_wins} : The player's score is #{player_wins}.")
    
  prompt("Do you want to play again? (y for yes)")
  answer = Kernel.gets.chomp
  break unless answer.downcase == 'y'
end

prompt("Thank you for playing. Goodbye!")

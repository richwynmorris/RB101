VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']
VALID_CHOICES_ABRV = ['r', 'p', 'sc', 'sp', 'l']
WINNING_SCORE = 5

scoreboard = {
  player: 0,
  computer: 0
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def transform_choice(choice)
  assign = {
    r: "rock",
    p: "paper",
    sc: "scissors",
    sp: "spock",
    l: "lizard"
  }
  assign[choice.to_sym]
end

def win?(first, second)
  assign_abrv = {
    rock: ['lizard', 'scissors'],
    paper: ['rock', 'spock'],
    scissors: ['paper', 'lizard'],
    spock: ['scissors', 'rock'],
    lizard: ['paper', 'spock']
  }
 assign_abrv[first.to_sym].include?(second)
end

def scoreboard_counter(player, computer, scoreboard)
  if win?(player, computer)
    scoreboard[:player] += 1
  elsif win?(computer, player)
    scoreboard[:computer] += 1
  end
end

def display_scoreboard(scoreboard)
  prompt("*************
  Player score is #{scoreboard[:player]}.
  Computer score is #{scoreboard[:computer]}.
  ************")
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
  scoreboard[:player] = 0
  scoreboard[:computer] = 0
end

def rules
  prompt("The rules are are as follows: 
  Scissors cuts paper.
  Paper covers rock.
  Rock crushes lizard.
  Lizard poisons Spock.
  Spock smashes scissors.
  Scissors decapitates lizard.
  Lizard eats paper.
  Paper disproves Spock.
  Spock vaporizes rock.
  Rock crushes scissors.")
end

def instructions
  prompt("
  You can use the following abbreviations:
  r for rock
  p for paper
  sc for scissors
  sp for spock
  l for lizard

  The winner is first to 5 and will be crowned the GRANDMASTER!

  Good luck!
  ")
end

prompt("Welcome to Rock, Paper, Scissors, Spock, Lizard!")

rules

instructions

loop do
  loop do
    choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}.")
      choice = Kernel.gets().chomp()
      if VALID_CHOICES.include?(choice)
        break
      elsif VALID_CHOICES_ABRV.include?(choice)
        choice = transform_choice(choice)
        break
      else
        prompt("That's not a valid choice")
      end
    end
    computer_choice = VALID_CHOICES.sample

    prompt("You chose: #{choice}; Computer chose: #{computer_choice}.")

    display_results(choice, computer_choice)

    scoreboard_counter(choice, computer_choice, scoreboard)

    display_scoreboard(scoreboard)

    if match_ended?(scoreboard)
      check_for_grandwinner(scoreboard)
      reset_scoreboard(scoreboard)
      break
    end
  end
  
  prompt("Do you want to play again? (y for yes)")
  answer = Kernel.gets.chomp
  break unless answer.downcase == 'y'
end

prompt("Thank you for playing. Goodbye!")

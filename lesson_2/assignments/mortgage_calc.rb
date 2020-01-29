# START
# GET amount to borrow.
# IF the amount valid and greater than 0.
# SET the variable as 'amount'.
# GET the interest.
# IF the interest valid and is greater than 0.
# SET the variable as 'interest'.
# GET loan duration in years
# IF loan duration valid and greater than 0.
# SET the variable as 'loan_time'.
# READ all variables.
# PROCESS mortgage_calc and perform the operation.
# GET confirmation from user to go again.
# IF 'y' loop back 
# ELSE BREAK
# PUTS goodbye prompt. 
# END

def prompt(message)
  puts "=> #{message}"
end

def valid_num?(num)
  num.to_i.to_s == num && num.to_i > 0
end

def valid_interest?(num)
  (num.to_f.to_s == num && num.to_f > 0) || num.to_i.to_s == num && num.to_i > 0
end

def calc_monthly_payment(amount, interest, loan_in_years)
  annual_interest = interest.to_f / 100
  monthly_interest = annual_interest / 12
  monthly_duration = loan_in_years.to_i * 12
  monthly_payment = amount.to_f * (monthly_interest / (1 - (1 + monthly_interest)**(-monthly_duration)))

  puts "Your monthly repayment will be £#{format('%02.2f', monthly_payment)}
  over #{monthly_duration} months."
end

prompt "Welcome to the Mortgage Calculator! What is your name?"
name = gets.chomp

prompt "Hello #{name}! Lets get started..."

loop do
  prompt "#{name}, how much would you like to borrow on your loan?"
  amount = ''
  loop do
    p = gets.chomp
    if valid_num?(p)
      break
    else puts "That's not a valid number, try again."
    end
  end
  prompt "Great stuff! What is your interest rate?"
  prompt "(Example: 5 for 5% or 2.5 for 2.5%)"
  interest = ''
  loop do
    interest = gets.chomp
    if valid_interest?(interest)
      break
    else puts "That's not a valid percentage.\n
    Remember to use a decimal point for your percentage.\n
    (example 2.5 = 2.5)"
    end
  end
  prompt "Excellent! We've almost got all we need.\n
  How long would you like the loan for in years?"

  loan_time = ''
  loop do
    loan_time = gets.chomp
    if valid_num?(loan_time)
      break
    else puts "That's not what we're looking for. Simply type the number.\n
      For example, one year would be '1'."
    end
  end
  prompt "Working on your mortgage repayments..."
  puts " "
  calc_monthly_payment(amount, interest, loan_time)
  prompt("Would you like to make another mortgage calculation? ('y' for yes)")
  again = gets.chomp
  break unless again.downcase.start_with? 'y'
end
prompt("Thank you for using the Mortgage Calculator, #{name}. Good bye.")

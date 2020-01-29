require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# ask the user for two intergers
# ask the user for an operation to use between the two numbers
# perform the operation
# output the result
# answer = Kernel.gets()
# Kernel.puts(answer)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(num)
  num.to_i().to_s == num
end

def float?(num)
  num.to_i.to_f == num
end
  
def number?(num)
  integer?(num) || float?(num)
end

def operator_to_method(op)
  word = case op
          when '1'
            'Adding'
          when '2'
            'Subtracting'
          when '3'
            'Multiplying'
          when '4'
            'Dividing'
         end
 
 word
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi #{name}! Lets get calculating!")

loop do
  answer1 = ''
  loop do
    prompt(MESSAGES['first_num'])
    answer1 = Kernel.gets().chomp()
    if number?(answer1)
      break
    else
      prompt(MESSAGES['valid_num'])
    end
  end

  answer2 = ''
  loop do
    prompt(MESSAGES['second_num'])
    answer2 = Kernel.gets().chomp()

    if number?(answer2)
      break
    else
      prompt(MESSAGES['valid_num'])
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['valid_op'])
    end
  end

  prompt("#{operator_to_method(operator)} the two numbers...")

  result = case operator
           when '1'
             answer1.to_i() + answer2.to_i()
           when '2'
             answer1.to_i() - answer2.to_i()
           when '3'
             answer1.to_i * answer2.to_i()
           when '4'
             answer1.to_f() / answer2.to_f()
           end

  prompt("The result is: #{result}.")

  prompt(MESSAGES['use_again'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end
prompt("Thank you for using the calculator app! Good bye.")
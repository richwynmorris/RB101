# define a method that takes in two arguements
# each arguement is added together nd assigned the variable sum
# The result is outputted to the console 
# request the first integer. assign variable and convert to interger
# request the second integet. assign variable and conver to interger
# run the method 

# START
# give two arguements to the method 'Add'
# Add both arguements together and assign as the variable 'sum'
# PRINT 'sum'
# GET the first number form the user. 
# SET as 'a'
# GET the second number from the user.
# SET as 'b'
# READ 'add' variable set .
# evoke method.  


def add(a, b) 
  sum = a + b
  puts sum
end

puts 'whats the first number to add?'
a = gets.chomp.to_i

puts 'whats the second number to add?'
b = gets.chomp.to_i

puts 'The answer is: ' 
add(a,b)







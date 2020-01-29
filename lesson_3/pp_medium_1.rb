# Question 1
10.times { |number| puts (" " * number) + "The Flintstones Rock!"}

# Question 2
# The code doesn't run as it cannot add the interger to the string. 
# The intergers must first be transformed into a sting:
puts "the value of 40 + 2 is " + (40 + 2).to_s
# Another way to do this is through string interpolation...
puts "the value of 40 + 2 is #{40 + 2}"

# Question 3
def factors(number)
  divisor = number
  factors = []
  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

# Bonus 3.1:
# The purpose of 'number % divisor == 0' is to check if the remainder is equal to 0. 
# If it's not. It's not a factor. 

# Bonus 3.2:
# The 'factors' statement returns the array of factors associated with that number.

# Question 4 
# In the first method, the buffer, as an arguement, will be modified in the outer scope.
# However, in the second method the "input_array" arguement won't be modified in the outer scope. 

# Quesiton 5
limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

# Question 6 
# 34

# Question 7
# Yes it does mess up the data and is assigns new variables to key, value pairs in the data. 

# Question 8 
# Paper 

# Question 9 
# 'no'
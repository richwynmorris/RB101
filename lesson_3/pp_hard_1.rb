#Question 1
# I predict that the following code will print nil as the value of greeting is a truthy.
# Therefore, it will not print the greeting "hello world" as the condition is not false.
# Moreover, the greeting will not print as the variable is not returned, simply assigned. 

if false
  greeting = “hello world”
end

greeting

# Question 2 
# I predict tha tthe last line of code will print the hash value assigned to the variabel 'greetings'
# e.g. {a: 'hi'}
# I was partially correct in my prediction as the hash was printed. However, what I failed to take 
# into account was the fact that ' there' would be shifted to the same object_id as greetings as the '<<'
# method mutates the original object. 
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# Question 3A
# "one is: #one"
#"two is: #two"
# "three is: #three"

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"


# Question 3B
# "one is: #one"
# "two is: #two"
# "three is: #three"

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# Question 3C
# "one is: #two"
# "two is: #three"
# "three is: #one"

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# Question 4 

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end

************************************************

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4
  
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  true 
end

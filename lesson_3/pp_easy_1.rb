# Question 1 
# The output will be 1,2,2,3 as the method invoked doesn't mutate the object. `
# To mutate the object you need to use 'numbers.uniq!'

numbers = [1,2,2,3]
numbers.uniq

puts numbers


# Question 2
# 1. != - 'not equals to' - This should be used as a conditional when checking a statement. 
# Returns true when 2 items are not equal to.  
# 2. !Username - returns the object as their opposite boolean value 
# 3. '!' - mutates the object - placing '!' after the method uniq will mutate the value of object permanately. 
# 4. '?' - if or else - used as a ternary operator 
# 5. '?' - converts to a single character string 
# 6. '!!' - returns object as it boolean value. 

# Question 3
advice = "Few things in life are as important as house training your pet dinosaur."

advice.split

advice['important'] = advice.replace(['urgent'])

puts advice

# Question 4
# The first method will delete the value at position '1' which is '2'
# The second method will delete value assigned '1' which is '1'

# Question 5
#(10..100).cover?(42)

# Question 6 
# 1) famous_words.prepend("Four score and ") 
# 2) famous_words.insert(0, "Four score and ") 

# Question 7
# 42 = (+8(+8(+8(+8(+8(2)

# Question 8 
flintstones = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
flintstones.flatten!
p flintstones

# Question 9
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones = flintstones.assoc("Barney")
puts flint
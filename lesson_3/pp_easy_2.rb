# Question 1 
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.key?("Spot")

# BONUS
ages.has_key?("Spot")
ages.has_value?("Spot")

# Question 2
munsters_description = "The Munsters are creepy in a good way."
p munsters_description.swapcase
p munsters_description.capitalize 
p munsters_description.downcase
p munsters_description.upcase

# Question 3 
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)
p ages

# Question 4
advice = "Few things in life are as important as house training your pet dinosaur."
advice.include?("Dino")
advice.match?("Dino")

# Question 5
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Question 6 
flintstones << "Dino"

# Question 7 
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push("Dino", "Happy")

# Question 8 
advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.slice!(0..38)
advice.slice!(0, advice.index('house'))
p advice[38..-1]

# Question 9 
statement = "The Flintstones Rock!"
statement.count "t"

# Question 10 
title = "Flintstone Family Members"
title.center(40)

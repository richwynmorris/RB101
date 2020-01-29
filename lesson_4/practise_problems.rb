# # Practise Problems Solution 1
# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# def transform(list)
#   flintstones_h = {}
#   counter = 0
  
#   loop do
#     break if counter == list.length
    
#     current_character = list[counter]
#     current_index = counter
    
#     flintstones_h[current_character] = current_index
    
#     counter += 1
    
#   end
  
#   puts flintstones_h
  
# end

# transform(flintstones)

# # Solution 1.2
# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# flintstones_h = {}
# flintstones.each_with_index{|name, index| 
#   flintstones_h[name] = index }
  
# puts flintstones_h

# Practise Problem 2 Solution 2
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# result = ages.each_value.sum

# puts result

# Pracitise Problem Solution 2.1
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# total_ages = 0 

# ages.each{ |_, age| total_ages += age}
# puts total_ages

# # Practise Problem 3
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# ages.delete_if {|k,v| v > 100 }

# puts ages

# #Practise Problem 3.1
# ages.keep_if { |_, age| age < 100 }

#`Practise Problem 4

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# lowest_age = ages.each_value.min

# puts lowest_age

#Practise Problem 5
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# puts flintstones.index{|letters| letters[0,2] == 'Be'}

# Practise Problem 6
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# puts flintstones.map!{|value| value = value[0,3]}

# Practise Problem 7
statement = "The Flintstones Rock"


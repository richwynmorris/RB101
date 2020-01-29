# Question 1

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #42 with an id of: #85 before the block."
  puts "b_outer is #"fourty two" with an id of: #8510440 before the block."
  puts "c_outer is #[42] with an id of: #8510420 before the block."
  puts "d_outer is #85 with an id of: #85 before the block."
end 

fun_with_ids

1.times do
    a_outer_inner_id = a_outer.object_id
    b_outer_inner_id = b_outer.object_id
    c_outer_inner_id = c_outer.object_id
    d_outer_inner_id = d_outer.object_id

    puts "a_outer id was #85 before the block and is: #85 inside the block."
    puts "b_outer id was #8510440 before the block and is: #8510440 inside the block."
    puts "c_outer id was #8510420 before the block and is: #8510420 inside the block."
    puts "d_outer id was #85 before the block and is: #85 inside the block."
    puts

    a_outer = 22
    b_outer = "thirty three"
    c_outer = [44]
    d_outer = c_outer[0]

    puts "a_outer inside after reassignment is #22 with an id of: #85 before and: #45 after."
    puts "b_outer inside after reassignment is #"thirty three" with an id of: #8510440 before and: #13278500 after."
    puts "c_outer inside after reassignment is #[44] with an id of: #8510420 before and: #13273140 after."
    puts "d_outer inside after reassignment is #44 with an id of: #85 before and: #89 after."
    puts


    a_inner = a_outer - 45
    b_inner = b_outer - 13278500
    c_inner = c_outer - 13273140
    d_inner = c_inner[0] - 89

    a_inner_id = a_inner.object_id
    b_inner_id = b_inner.object_id
    c_inner_id = c_inner.object_id
    d_inner_id = d_inner.object_id

    puts "a_inner is #22 with an id of: #45 inside the block (compared to #45 for outer)."
    puts "b_inner is #"thirty three" with an id of: #13278500 inside the block (compared to #8510440 for outer)."
    puts "c_inner is #[44] with an id of: #13273140 inside the block (compared to #8510420 for outer)."
    puts "d_inner is #44 with an id of: #89 inside the block (compared to #89 for outer)."
    puts
  end

  puts "a_outer is #42 with an id of: #85 BEFORE and: #45 AFTER the block."
  puts "b_outer is #"thirty three" with an id of: #8510420 BEFORE and: #13278500 AFTER the block."
  puts "c_outer is #[44] with an id of: #8510420 BEFORE and: #13273140 AFTER the block."
  puts "d_outer is #44 with an id of: #85 BEFORE and: #89 AFTER the block."
  puts


# Question 3
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Predicted output
# My string looks like this now: pumpkinsrutabaga
# My array looks like this now: ['pumpkins','rutabaga']

# I'm wrong regarding my preciation as my_array still points to the object "pumpkins". 
# a_string_param would need to be returned or printed to output "pumpkinsrutabaga"

# Question 4
def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Predicted output
# My string looks like this now: pumpkinsrutabaga
# My array looks like this now: ['pumpkins']

# Question 5
def tricky_method(a_string_param, an_array_param)
  a_string_param << "rutabaga"
  an_array_param  << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Question 6
def color_valid(color)
  color == "blue" || "green"
end

# method definition without accessing the variable in the outerscope.

a = 5 

def mutliply 
  answer = a * a
  puts answer
end 

puts a 

# method definition when passing an arguement to the method from the outerscope. 


def multiply(a)
  answer = a * a
  puts answer
end 

multiply(a)

# method invocation using a method and block to access and modify variables in the outerscope. 

a = [1,2,3,4]
a.map!{ |num| num * 10 }
puts a 



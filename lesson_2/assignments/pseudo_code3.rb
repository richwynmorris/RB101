def every_other(arr)
arr.select.with_index do |num, idx|
  puts num if idx % 2 > 0
end
end 


array = [4,6,2,3,5,3]

every_other(array)

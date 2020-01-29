arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

p (arr.map do |sub_arr|
  sub_arr.select do |el|
    el % 3 == 0
  end
end)
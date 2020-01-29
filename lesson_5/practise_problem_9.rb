arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

p (arr.map do |sub_arr|
  sub_arr.sort do |a, b|
    b <=> a
  end
end)


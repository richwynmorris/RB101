p ([{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  new_hsh = {}
  hsh.each do |key,value|
    new_hsh[key] = value + 1
  end
  new_hsh
end)


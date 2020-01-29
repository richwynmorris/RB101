hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = 'aeiou'

hsh.each do |key, value|
  value.each do |item|
    item.chars.each do |char|
    if vowels.include?(char)
      puts char
    end
    end
  end
end
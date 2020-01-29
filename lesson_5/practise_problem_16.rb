def uuid_generator 
  hexidecimal_characters = []
  
  (0..9).each {|num| hexidecimal_characters << num.to_s}
  ('a'..'b').each {|letter| hexidecimal_characters << letter}
  
  uuid_format = [8,4,4,4,12]
  
  uuid = ''
  
  uuid_format.each_with_index do |section, index|
    section.times {uuid += hexidecimal_characters.sample}
    uuid += '-' unless index == uuid_format.size
  end
  uuid.chop
end

p uuid_generator
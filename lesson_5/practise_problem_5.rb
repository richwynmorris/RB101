munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}


munster_ages = 0

munsters.each do |munster, info|
                info.each do |key,value|
                  if value == 'male'
                    munster_ages += info["age"]
                  end
                end
end
                
puts munster_ages
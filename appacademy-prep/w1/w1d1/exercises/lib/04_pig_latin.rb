VOWELS = "aeiou".chars

def translate(string)
  string_split = string.split(" ")

  string_split.map! do |word|
	split = word.chars
	split.each do |char|
		if split[0].downcase == "u" && split[-1].downcase == "q"
        split.push(split.shift)
  			split.push("ay")
  			break
  		elsif VOWELS.include?(split[0].downcase)
  			split.push("ay")
  			break
  		else
  			split.push(split.shift)
  		end
	end
	split.join
  end
  string_split.join(" ")
end

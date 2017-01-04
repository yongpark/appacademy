def echo(string)
  string
end

def shout(string)
  string.upcase
end

def repeat(string, num = 2)
  strings = ""
  i = 0
  until i == num - 1
  	strings << string + " "
  	i += 1
  end
  strings << string
  strings
end


def start_of_word(string, num)
  split = string.chars
  strings = ""
  i = 0
  until i == num
    strings << split.shift
    i += 1
  end
  strings
end

def first_word(string)
  split = string.split
  split[0]
end

def titleize(string)
  words = ["the", "over", "and"]
  split = string.split
  split.map!.each do |word|
  	if !words.include?(word)
  		word.capitalize
  	elsif words.include?(word) && split[0] == word
  		word.capitalize
  	else
  		word
  	end
  end
  split.join(" ")
end
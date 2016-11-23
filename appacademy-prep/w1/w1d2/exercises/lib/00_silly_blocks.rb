def reverser(&prc)
  sentence = prc.call
  split = sentence.split(" ")
  split.map {|word| word.reverse}
  .join(" ")
end

def adder(num = 1, &prc)
  value = prc.call
  value += num
end

def repeater(num = 2, &prc)
  num.times {prc.call}
end
def add(num1, num2)
  num1 + num2
end

def subtract(num1, num2)
  (num1 - num2).abs
end


def sum(array)
  if array.empty?
    0
  end
  sum = 0
  array.each do |num|
    sum += num
  end
  sum
end


def multiply(num, *args)
  answer = 1
  answer = answer * num
  args.each do |num|
  	answer = answer * num
  end
  answer
end

def power(num1, num2)
  answer = num1 ** num2
end

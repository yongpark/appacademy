def sum_to(num)
  return num if num <= 1
  num + sum_to(num-1)
end


sum_to(5)  # => returns 15
sum_to(1)  # => returns 1
sum_to(9)  # => returns 45
sum_to(-8)  # => returns nil

def add_numbers(num)
end
add_numbers([1,2,3,4]) # => returns 10
add_numbers([3]) # => returns 3
add_numbers([-80,34,7]) # => returns -39
add_numbers() # => returns nil

def gamma_fnc(num)
  return num if num <= 1
  num * gamma_fnc(num-1)
end
gamma_fnc(0)  # => returns nil
gamma_fnc(1)  # => returns 1
gamma_fnc(4)  # => returns 6
gamma_fnc(8)  # => returns 5040

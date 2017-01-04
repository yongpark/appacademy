require 'byebug'

def range(start_num, end_num)
  return [] if end_num < start_num
  return [start_num] if start_num == end_num
  [start_num] + range((start_num + 1), end_num)
end


p range(5, 10)


a = [1,2,3,4,5,6]
def sum_of_array(array)
  array.inject(:+)
end

# p sum_of_array(a)

def sum_of_array_recurs(array)
  return array.first if array.length <= 1
  sum = array.first
  sum += sum_of_array_recurs(array[1..-1])
end

p sum_of_array_recurs(a)

def exp1(b,n)
  return 0 if b == 0
  return nil if n < 0
  return 1 if n == 0
  b * exp1(b, n - 1)
end

p exp1(5, 2)

def exp2(b,n)
  return nil if n < 0
  return 1 if n == 0
  if n.even?
    exp2(b, n / 2) * exp2(b, n / 2)
  else
    b * (exp2(b, (n - 1) / 2) ) * (exp2(b, (n - 1) / 2) )
  end
end

p exp2(5,3)


class Array

    def deep_dup
      #return self.first if self.length <= 1
      duped = []
      #debugger
      self.each do |el|
        if el.is_a?(Array)
          duped << el.deep_dup
        else
          duped << el
        end
      end
      duped
    end
end

robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

def fibonacci(n)
  #return [1] if n == 1
  return [1, 1] if n == 2
  previous = fibonacci(n - 1)
  previous << previous[-1] + previous[-2]
  previous
end

def fibonacci_it(n)
  arr = [1, 1]
  (n - 2).times do |i|
    arr << arr.last + arr[-2]
  end

  arr
end


def permutations(array)
  return [array] if array.length == 1
   p previous_array = permutations(array[0..-2])
  new_array = []
  previous_array.each do |el|
    new_array << [el] + [array.last]
    new_array << [array.last] + [el]
  end
  new_array
end

permutations([1,2])


def bsearch(array, target_num)
  return nil if array.empty? || array.length == 1 && array[0] != target_num
  middle = array.length / 2
  #debugger
  if array[middle] == target_num
    return middle
  elsif target_num < array[middle]
    return bsearch(array[0...middle], target_num)
  else
    right = bsearch(array[middle..-1], target_num)
    return right if right.nil?
    middle + right
  end
end



def merge_sort(array)
  return [] if array.length == 0
  return array if array.length == 1

  middle_point = array.length / 2
  array = array.each_slice(middle_point).to_a
  array.each do |half|
    merge_sort(half)
  end


  # halves = []
  # halves << array[0...(array.length / 2)]
  # halves << array[(array.length / 2)..-1]
  # halves.each do |array2|
  #   halves merge_sort(array2)
  # end
  # halves
end

merge_sort([1,2,3,4,5,6,7])

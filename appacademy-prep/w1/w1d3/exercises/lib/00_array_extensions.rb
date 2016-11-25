# Sum
#
# Write an Array method, `sum`, that returns the sum of the elements in the
# array. You may assume that all of the elements are integers.

class Array
  def sum
    @sum = 0
    if self.nil?
      return 0
    else
      self.each do |num|
        @sum += num
      end
    end
    @sum
  end
end

# Square
#
# Write an array method, `square`, that returns a new array containing the
# squares of each element. You should also implement a "bang!" version of this
# method, which mutates the original array.

class Array
  def square!
    if self.nil?
      return 0
    else
      self.map! do|num|
        num ** 2
      end
    end
    self
  end

  def square
    @arr = []
    if self.nil?
      return 0
    else
      self.map do|num|
        @arr << num ** 2
      end
    end
    @arr
  end
end

# Finding Uniques
#
# Monkey-patch the Array class with your own `uniq` method, called
# `my_uniq`. The method should return the unique elements, in the order
# they first appeared:
#
# ```ruby
# [1, 2, 1, 3, 3].my_uniq # => [1, 2, 3]
# ```
#
# Do not use the built-in `uniq` method!

class Array
  def my_uniq
    arr = []
    self.each do |num|
      arr << num if !arr.include?(num)
    end
    arr
  end
end

# Two Sum
#
# Write a new `Array#two_sum` method that finds all pairs of positions
# where the elements at those positions sum to zero.
#
# NB: ordering matters. I want each of the pairs to be sorted smaller
# index before bigger index. I want the array of pairs to be sorted
# "dictionary-wise":
#
# ```ruby
# [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]
# ```
#
# * `[0, 2]` before `[1, 2]` (smaller first elements come first)
# * `[0, 1]` before `[0, 2]` (then smaller second elements come first)

class Array
  def two_sum
    arr = []
    self.each_with_index do |num1, idx1|
      self.each_with_index do |num2, idx2|
        if num1 + num2 == 0 && idx1 < idx2
          arr << [idx1, idx2]
        end
      end
    end
    if arr.empty?
      return []
    else
      return arr
    end
  end
end

# Median
#
# Write a method that finds the median of a given array of integers. If
# the array has an odd number of integers, return the middle item from the
# sorted array. If the array has an even number of integers, return the
# average of the middle two items from the sorted array.

class Array
  def median
    arr = self.sort
    if arr.empty?
      return nil
    end
    if arr.length == 1
      return arr[0]
    end
    if arr.length % 2 == 0
      return (arr[(arr.length/2)] + arr[(arr.length/2) - 1]) / 2.0
    else
      return arr[(arr.length/2)]
    end
  end
end

# My Transpose
#
# To represent a *matrix*, or two-dimensional grid of numbers, we can
# write an array containing arrays which represent rows:
#
# ```ruby
# rows = [
#     [0, 1, 2],
#     [3, 4, 5],
#     [6, 7, 8]
#   ]
#
# row1 = rows[0]
# row2 = rows[1]
# row3 = rows[2]
# ```
#
# We could equivalently have stored the matrix as an array of
# columns:
#
# ```ruby
# cols = [
#     [0, 3, 6],
#     [1, 4, 7],
#     [2, 5, 8]
#   ]
# ```
#
# Write a method, `my_transpose`, which will convert between the
# row-oriented and column-oriented representations. You may assume square
# matrices for simplicity's sake. Usage will look like the following:
#
# ```ruby
# matrix = [
#   [0, 1, 2],
#   [3, 4, 5],
#   [6, 7, 8]
# ]
#
# matrix.my_transpose
#  # => [[0, 3, 6],
#  #    [1, 4, 7],
#  #    [2, 5, 8]]
# ```
#
# Don't use the built-in `transpose` method!

class Array
  def my_transpose
  	arr = Array.new(self.length){Array.new(self[0].length)}
    self.each_with_index do |row, idx|
      row.each_with_index do |num, idx2|
       arr[idx2][idx] = num
      end
    end
    arr
  end
end

# Bonus: Refactor your `Array#my_transpose` method to work with any rectangular
# matrix (not necessarily a square one).
require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil)
    accumulator = self.shift if accumulator == nil
    self.each do |el|
      accumulator = proc.call(accumulator, el)
    end
    accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  (2...num).each do |el|
    if num % el == 0
      return false
    end
  end
end

def primes(num)
  prime_arr = []
  i = 2
  while prime_arr.length < num
    if is_prime?(i)
      prime_arr << i
    end
    i += 1
  end
  prime_arr
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [] if num == 0
  return [1] if num == 1
  previous = factorials_rec(num -1)
  previous << previous[-1] * (num-1)
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    dups = self.select {|el| self.count(el) > 1}.uniq
    dup_hash = Hash.new {|k, v| k[v] = []}
    dups.each do |el|
      self.each_index do |idx|
        dup_hash[el] << idx if el == self[idx]
      end
    end
    dup_hash
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.
  def palindrome?
    self == self.reverse
  end

  def symmetric_substrings
    symm = []
    (0..self.length-2).each do |start|
      (start+1..self.length-1).each do |finish|
        if self[start..finish].palindrome?
          symm << self[start..finish]
        end
      end
    end
    symm
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    return self if length <= 1
    mid = self.length / 2
    left = self.take(mid).merge_sort(&prc)
    right = self.drop(mid).merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    prc ||= Proc.new {|x, y| x <=> y}
    merged = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end
    merged += left += right
  end
end

class Array
  def quick_sort(&prc)
    return self if self.length <= 1
    prc ||= Proc.new {|x, y| x <=> y}
    pivot = self.first
    left = []
    right = []
    i = 1
    while i < self.length
      case prc.call(self[i], pivot)
      when -1
        left << self[i]
      when 1 || 0
        right << self[i]
      end
      i += 1
    end
    left.quick_sort(&prc) + [pivot] + right.quick_sort(&prc)
  end
end

([1,2,3,4,5,5,6,7]).to_a.shuffle.quick_sort

def quicksort(arr)
  return arr if arr.length <= 1
  pivot = arr.shift
  left = arr.select {|i| i < pivot}
  right = arr.select {|i| i > pivot}
  quicksort(left) + [pivot] + quicksort(right)
end


class Array
  def bsearch(target, &prc)
    return nil if self.empty?
    prc ||= Proc.new {|x, y| x <=> y}
    index = self.length / 2
    case prc.call(target, self[index])
    when -1
      self.take(index).bsearch(target, &prc)
    when 0
      return index
    when 1
      sub_answer = self.drop(index).bsearch(target, &prc)
      (sub_answer.nil?) ? nil : (index) + sub_answer
    end
  end
end


[1,2,3,4,5,6,7,8,9].bsearch(8)






def bsearch(nums, target)
  return nil if nums.empty?
  index = nums.length / 2
  case target <=> nums[index]
  when -1
    bsearch(nums.take(index), target)
  when 0
    return index
  when 1
    search = bsearch(nums.drop(index), target)
    (search.nil?) ? nil : (index) + search
  end
end

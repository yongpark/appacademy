require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil)
    accumulator ||= self.shift
    self.each do |el|
      accumulator = proc.call(accumulator, el)
    end
    accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  (2...num).to_a.each do |el|
    if num % el == 0
      return false
    end
  end
end

def primes(num)
  prime_list = []
  prime_candidate = 2

  while prime_list.length < num do
    prime_list << prime_candidate if is_prime?(prime_candidate)
    prime_candidate += 1
  end
  prime_list
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num <= 0
  return [1] if num == 1
  previous = factorials_rec(num - 1)
  previous << previous[-1] * (num-1)
  # next_factorial = prev_factorials[-1] * (num - 1)
  # return previous + [next_factorial]
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    # counts = Hash.new(0)
    # self.each do |el|
    #   counts[el] += 1
    # end
    # arr = []
    # counts.each do |k, v|
    #   arr << k if v > 1
    # end
    # answer = Hash.new
    # arr.each do |el|
    #   answer[el] = self.each_index.select{|i| self[i] == el}
    # end
    # answer
    dup_els = self.select {|el| self.count(el) > 1}.uniq
    dup_hash = Hash.new { |h,k| h[k] = []}

    dup_els.each do |el1|
      self.each_with_index do |el2, idx|
        dup_hash[el1] << idx if el2 == el1
      end
    end

    dup_hash
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.
  def is_palindrome?
    self == self.reverse
  end

  def symmetric_substrings
    substrings = []

    (0..self.length - 2).each do |start|
      (start + 1...self.length).each do |finish|
        if self[start..finish].is_palindrome?
          substrings << self[start..finish]
        end
      end
    end

    substrings
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    return self if self.length <= 1
    prc ||= Proc.new {|x, y| x <=> y}
    mid = self.length/2
    left = self.take(mid).merge_sort(&prc)
    right = self.drop(mid).merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
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



def quicksort(array)
  retrun array if array.length <= 1
  pivot = array.shift
  left = array.select {|i| i < pivot }
  right = array.select {|i| i > pivot }
  quicksort(left) + [pivot] + quicksort(right)
end

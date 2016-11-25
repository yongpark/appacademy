#Phase 1
#O(n^2)
list = [0,3,5,4,-5,10,1,90]

def my_min_1(array)
  array.each do |num1|
    smallest = true
    array.each do |num2|
      if num1 > num2 && num1 != num2
        smallest = false
      end
    end
    return num1 if smallest == true
  end
end


#O(n)
def my_min_2(array)
  smallest = array.first
  array.each do |el|
    smallest = el if el < smallest
  end
  smallest
end

#O(n^3)
def largest_continguous_subsum_1(array)
  subsets = []
  array.each_index do |idx1|
    (idx1...array.length).to_a.each do |idx2|
      subsets << array[idx1..idx2]
    end
  end
  max = subsets[0].inject(:+)

  subsets.each do |subset|
    max = subset.inject(:+) if subset.inject(:+) > max
  end
  max
end

#O(n)
def largest_continguous_subsum_2(list)
  max = 0
  current = 0
  list.each do |el|
    current += el
    max = current if current > max
    if current < 0
      current = 0
    end
  end
  max
end

#O(n!)
def first_anagram?(word1, word2)
  words = word1.split("").permutation(word1.length)

  words.each do |perm|
    if perm.join("") == word2
      return true
    end
  end
  false
end

#O(n^2)
def second_anagram?(word1, word2)
  word1 = word1.split("")
  word2 = word2.split("")
  word_length = word1.length
  word_length.times do
    if word2.include?(word1.first)
      word2.delete_at(word2.index(word1.first))
      word1.shift
    end
  end
  return word2 == [] && word1 == []
end

#O(nlogn)
def third_anagram?(word1, word2)
  word1.split("").sort == word2.split("").sort
end

#O(n)
def fourth_anagram?(word1, word2)
  letter_hash = Hash.new {|h,k| h[k]= [0, 0]}
  word1 = word1.split("")
  word2 = word2.split("")
  word1.length.times do |el|
    letter_hash[word1[el]][0] += 1
    letter_hash[word2[el]][1] += 1
  end
  letter_hash.values.all?{|x, y| x == y}
end

# initialize with 0 instead of array of 0,0
# add 1 for word1 minus 1 for word 2

#o(n^2)
def bad_two_sum?(arr, target_sum)

  arr.each_with_index do |el1, idx1|
    arr.each_with_index do |el2, idx2|
      next if idx1 == idx2 || idx1 > idx2
      value = (el1 + el2 == target_sum)
      return value if value
    end
  end
  false
end

#O(nlog(n))
def okay_two_sum?(arr, target_sum)
  array_sorted = arr.sort
  half_target = target_sum / 2
  left = arr.select { |value| value < half_target }
  right = arr.select { |value| value >= half_target }
  until left.empty? || right.empty?
    case left.last + right.first <=> target_sum
    when -1
      right.shift
    when 0
      return true
    when 1
      left.pop
    end
  end
  false
end

#O(n)
def awesome_two_sum?(array, target)
  array_hash = Hash.new { |h, k| h[k] = false}
  array.each do |el|
    array_hash[el] = true
    if array_hash[(target - el)]
      return true
    end
  end
  false
end



#Max Windowed Range
#O(n^2)
def naive_window(array, w)
  current_max_range = nil
  array.each_index do |idx|
    sub_array = array[idx...(idx+w)]
    current_max_range = sub_array.max - sub_array.min if current_max_range.nil? || sub_array.max - sub_array.min > current_max_range
  end
  current_max_range
end

def optimized_window(array, w)
  w.times do
    queue << array.shift
  end
  (array.length - w).times do

    queue << array.shift
    queue.shift
  end

def fibonacci(n)
  return [1] if n == 1
  return [1, 1] if n == 2
  previous = fibonacci(n-1)
  previous << previous[-2] + previous[-1]
  previous
end

class Array
  def deep_dup
    return self.first if self.length <= 1
    duped = []
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


def fibonacci(n)
  return [1] if n == 1
  return [1,1] if n == 2
  previous = fibonacci(n-1)
  previous << previous[-1] + previous[-2]
  previous
end


def permutations(array)
  return [array] if array.length <=1
  result = []
  array.each_with_index do |el, idx|
    rest = array.take(idx) + array.drop(idx + 1)
    perms = permutations(rest)
    perms.each do |perm|
      result << [el] + perm
    end
  end
  result
end

class Array
  def quicksort(&prc)
    return self if self.length <= 1
    prc ||= Proc.new { |x, y| x <=> y }
    pivot = self.first
    left = []
    right = []
    i = 1
    while i < self.length
      case prc.call(self[i], pivot)
      when -1  #left
        left << self[i]
      when 1 ||0
        right << self[i]
      end
      i += 1
    end
    left.quicksort(&prc) + [pivot] + right.quicksort(&prc)
  end
end


def quicksort(arr)
  return arr if arr.length <= 1
  pivot = arr.first
  left_arr = arr[1..-1].select { |i| i <= pivot }
  right_arr = arr[1..-1].select { |i| i > pivot }
  quicksort(left_arr) + [pivot] + quicksort(right_arr)
end

([1,2,3,4,5,5,6,7]).to_a.shuffle.quicksort

#return arr if arr.length == 1
#take first element of arr and use it as your pivot point
#make array of all elements smaller
#make array of all elemenets bigger or equal
#combine quicksort left, pivot, quisort right
#[left array with  just 1 element ] [pivot] [ right array with 1 el]
#[1,3,4,1,5,4]
#[1] + [2] {3}

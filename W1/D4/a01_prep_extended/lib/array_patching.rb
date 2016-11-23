require 'byebug'
class Array

  def my_each(&prc)
    arr = []
    self.each do |el|
      arr << prc.call(el)
    end
    arr

  end

  def my_each_with_index(&prc)
    arr = []
    self.each_with_index do |el, idx|
      arr << prc.call(el, idx)
    end
    arr
  end

  def my_select(&prc)
    arr = []
    self.each do |el|
      arr << el if prc.call(el)
    end
    arr
  end

  def my_reject(&prc)
    arr = []
    self.each do |el|
      arr << el if !prc.call(el)
    end
    arr
  end

  def my_any?(&prc)
    self.each do |el|
      if prc.call(el)
        return true
      end
    end
    false
  end

  def my_all?(&prc)
    self.each do |el|
      if !prc.call(el)
        return false
      end
    end
    true
  end

  # Takes a multi-dimentional array and returns a single array of all the elements
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,5]
  def my_flatten
    arr = []
    self.each do |el|
      if el.is_a?(Array)
        arr += el.my_flatten
      else
        arr << el
      end
    end
    arr
  end

  # Write a version of flatten that only flattens n levels of an array.
  # E.g. If you have an array with 3 levels of nested arrays, and run
  # my_flatten(1), you should return an array with 2 levels of nested
  # arrays
  #
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,[5]]
  def my_controlled_flatten(n)
    arr = []
    if n == 0
      self.each do |el|
          arr << el
      end
    elsif n > 0
      self.each do |el|
        if el.is_a?(Array)
          arr += el.my_controlled_flatten(n-1)
        else
          arr << el
        end
      end
    end
    arr
  end

  def my_zip(*arrs)
    arr = []
    self.each_index do |idx|
      temp = []
      temp << self[idx]
      arrs.each_with_index do |subs, idx2|
        temp << subs[idx]
      end
      arr << temp
    end
    arr
  end

  def my_rotate(num = 1)
    rotations = num % length
    duped = self.dup
    rotations.times do
      duped << duped.shift
    end
    duped
  end

  def my_join(str = "")
    string = ""
    self.each_with_index do |el, idx|
      string += self[idx]
      string += str unless idx == self.length - 1
    end
    string
  end

  def my_reverse
    duped = self.dup
    duped.reverse
  end

  #Write a monkey patch of quick sort that accepts a block
  def my_quick_sort(&prc)
    return self if self.length <= 1
    prc ||= Proc.new {|x,y| x <=> y}

    pivot = self.first
    smaller = self[1..-1].select {|el| prc.call(pivot, el) == 1}
    bigger = self[1..-1].select {|el| prc.call(pivot, el) <= 0}

    smaller.my_quick_sort(&prc) + [pivot] + bigger.my_quick_sort(&prc)
  end

  # Write a monkey patch of binary search that accepts a comparison block:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(6) {|el, targ| el+1 <=> targ} => 4
  def my_bsearch(target, &prc)
    prc ||= Proc.new { |x, y| x <=> y }
    return nil if self.empty?
    index = self.length / 2

    case prc.call(target, self[index])
    when -1
      self.take(index).my_bsearch(target, &prc)
    when 0
      return index
    when 1
      answer = self.drop(index + 1).my_bsearch(target, &prc)
      if !answer.nil?
        answer + index + 1
      end
    end
  end

end

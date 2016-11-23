require 'byebug'
class Array
  def my_each(&prc)
    i = 0
    if !prc.nil?
      while i < self.count
        prc.call(self[i])
        i += 1
      end
    end
    self
  end

  def my_select(&prc)
    array = []
    self.my_each  do |el|
      if prc.call(el) == true
        array << el
      end
    end
    array
  end

  def my_reject(&prc)
      array = []
      self.my_each  do |el|
        if prc.call(el) == false
          array << el
        end
      end
      array
  end

  def my_any?(&prc)
    self.my_each do |el|
      if prc.call(el) == true
        return true
      end
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |el|
      if prc.call(el) == false
        return false
      end
    end
    true
  end

  def my_flatten
    flattened = []
    self.each do |el|
      if el.class == Array
        flattened += el.my_flatten
          #flattened << el1.my_flatten
      else
        flattened << el
      end
    end
    flattened
  end
  p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten

  def my_zip(*arg)
    zipped = []

    my_each_with_index do |el, idx|
      temp = []

      temp << el
      arg.my_each do |other_el|
        temp << other_el[idx]
      end

      zipped << temp
    end

    zipped
  end

  def my_rotate(shift=1)
    rotated = self.dup

    shift.times do
      rotated << rotated.shift
    end

    rotated
  end

  def my_join(char = "")
    str = ""
    my_each do |el|
      str << el + char
    end
    str[0...str.length - 1]
  end

  def my_reverse
    array = []
    self.each do |el|
      array.insert(0, el)
    end
    array
  end
end

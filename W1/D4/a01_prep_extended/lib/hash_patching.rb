class Hash

  # Write a version of my each that calls a proc on each key, value pair
  def my_each(&prc)
    self.each do |k, v|
      prc.call(k, v)
    end
    self
  end
  # Write a version of merge. This should NOT modify the original hash
  def my_merge(hash2)
    hash = Hash.new { |h, k| h[k] = [] }
    self.each do |h, k|
      hash[h] = k
    end
    hash2.each do |h, k|
      hash[h] = k
    end
    hash
  end

end

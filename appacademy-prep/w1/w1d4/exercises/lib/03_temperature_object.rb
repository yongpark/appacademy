class Temperature
  # TODO: your code goes here!
  def initialize(degrees)
    @f = degrees[:f]
    @c = degrees[:c]
  end

  def in_celsius
    @f.nil? ? @c : (@f - 32) * 5 / 9.0
  end

  def in_fahrenheit
    @c.nil? ? @f : (@c * 9 / 5.0) + 32
  end

  def self.from_celsius(degrees)
    self.new(c: degrees)
  end

  def self.from_fahrenheit(degrees)
    self.new(f: degrees)
  end
end

class Celsius < Temperature
  def initialize(degrees)
    super(c: degrees)
  end
end

class Fahrenheit < Temperature
  def initialize(degrees)
    super(f: degrees)
  end
end

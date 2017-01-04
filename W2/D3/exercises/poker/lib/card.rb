class Card
  attr_reader :value, :suite
  def initialize(suite, value)
    @suite = suite
    @value = value
  end

  def to_s
    [self.suite, self.value]
  end
end

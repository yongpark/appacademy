require 'byebug'

class Tile
  attr_reader :value

  def initialize(value)
    @mutable = value == 0 ? true : false
    @value = value
  end

  def to_s
    if @value == 0
      "_"
    else
      @value.to_s
    end
  end

end

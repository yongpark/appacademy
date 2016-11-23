class Card
  attr_reader :face_value, :up

  def initialize(val)
    @face_value = val
    @up = false
  end

  def hide
    @up = false
  end

  def reveal
    @up = true
  end

  def to_s
    if @up
      "|#{@face_value}|"
    else
      "[ ]"
    end
  end

  def ==

  end
end

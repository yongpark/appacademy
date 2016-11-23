class Board
  attr_accessor :grid

  LINES =[
  [[0, 0], [0, 1], [0, 2]],
  [[1, 0], [1, 1], [1, 2]],
  [[2, 0], [2, 1], [2, 2]],
  [[0, 0], [1, 0], [2, 0]],
  [[0, 1], [1, 1], [1, 2]],
  [[0, 2], [1, 2], [2, 2]],
  [[0, 0], [1, 1], [2, 2]],
  [[0, 2], [1, 1], [2, 0]]
  ]

  def initialize(grid = Array.new(3){Array.new(3)})
    @grid = grid
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end

  def place_mark(pos, mark)
    self[pos] = mark
  end

  def empty?(pos)
    if self[pos].nil?
      true
    else
      false
    end
  end

  def winner
    if (has_winning_line?(:X))
      return :X
    elsif (has_winning_line?(:O))
      return :O
    else
      return nil
    end
  end

  def has_winning_line?(type)
    LINES.any? do |line|
      line.all? do |point|
        grid[point[0]][point[1]] == type
      end
    end
  end

  def over?
    if blank?
      return false
    elsif winner == :X || winner == :O
      return true
    elsif full? == false
      return false
    elsif winner == nil
      return true
    end
  end

  def blank?
    @grid.all? do |line|
      line.all? do |point|
        point == nil
      end
    end
  end

  def full?
    @grid.all? do |line|
      line.all? do |point|
        point != nil
      end
    end
  end

end

#grid.flatten.none? {|pos| pos.nil? } || winner

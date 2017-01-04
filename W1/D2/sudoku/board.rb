require_relative 'tile'
require 'byebug'
class Board
  attr_reader :grid
  def initialize(grid = Array.new(9) { Array.new(9) })
    @grid = grid
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def render
    top_string = "   "
    (1..9).each do |s, k|
      top_string << " #{s} "
      top_string << "|" if s % 3 == 0 && k != 0
    end
    body = top_string + "\n" + "  -----------------------------" +  "\n"
    @grid.each_with_index do |row, i|
      if i % 3 == 0 && i != 0
        body += "\n  ----------|---------|----------" +  "\n"
      end
      current_str = "#{i + 1} |"
      row.each_with_index do |tile, j|
        current_str << "|" if (j) % 3 == 0 && j != 0
        current_str << " " + tile.to_s + " "
      end
      unless (i + 1) % 3 == 0
        current_str += "\n  |         |         |" + "\n"
      end
      body << current_str
    end
    puts body
  end

  def from_file(filename)
    raise "Invalid filename" unless File.file?(filename)
    new_grid = []
    File.readlines(filename).each_with_index do |line, idx|
      line.strip.split("").each_with_index do |num, idx2|
        self[[idx, idx2]] = Tile.new(num.to_i)
      end
    end
  end

  def solved?
    all_rows = rows + columns
    all_rows.all? { |r| r.uniq.length == 9 && !(r.include?(0)) }
  end

  private
  def rows
    rows = []
    (0..8).each do |idx|
      c_row = []
      (0..8).each do |idx2|
        c_row << self[[idx, idx2]].value
      end
      rows << c_row
    end
    rows
  end

  def columns
    columns = []
    (0..8).each do |idx|
      c_row = []
      (0..8).each do |idx2|
        c_row << self[[idx2, idx]].value
      end
      columns << c_row
    end
    columns
  end

end

board = Board.new
board.from_file("sudoku1.txt")
board.grid
board.render
puts board.solved?

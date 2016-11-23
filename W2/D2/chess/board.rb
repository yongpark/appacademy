# require relative "Display"
require_relative "piece.rb"
require "colorize"

class Board
  attr_accessor :grid

  def initialize(grid = Array.new(8) {Array.new(8)})
    @grid = grid
    self.populate
  end

  def [] (pos)
    x,y = pos
    @grid[x][y]
  end

  def []= (pos, value)
    x,y = pos
    @grid[x][y] = value
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].class == Piece && self[end_pos].class == NullPiece
      self[start_pos] = NullPiece.new
      self[end_pos] = Piece.new
    elsif
      self[end_pos].class == NullPiece
      raise "Can't move here"
    end
  end

  def populate
    @grid.each_with_index do |row, idx|
      row.each_with_index do |el, idx2|
        if idx == 1
          @grid[idx][idx2] = Pawn.new(idx, idx2, self, :white)
        elsif idx == 6
          @grid[idx][idx2] = Pawn.new(idx, idx2, self, :black)
        elsif [idx, idx2] == [0,0] || [idx, idx2] == [0,7]
          @grid[idx][idx2] = Rook.new(idx, idx2, self, :white)
        elsif [idx, idx2] == [7,7] || [idx, idx2] == [7,0]
          @grid[idx][idx2] = Rook.new(idx, idx2, self, :black)
        elsif [idx, idx2] == [0,1] || [idx, idx2] == [0,6]
          @grid[idx][idx2] = Knight.new(idx, idx2, self, :white)
        elsif [idx, idx2] == [7,1] || [idx, idx2] == [7,6]
          @grid[idx][idx2] = Knight.new(idx, idx2, self, :black)
        elsif [idx, idx2] == [0,2] || [idx, idx2] == [0,5]
          @grid[idx][idx2] = Bishop.new(idx, idx2, self, :white)
        elsif [idx, idx2] == [7,2] || [idx, idx2] == [7,5]
          @grid[idx][idx2] = Bishop.new(idx, idx2, self, :black)
        elsif [idx, idx2] == [7,3]
          @grid[idx][idx2] = Queen.new(idx, idx2, self, :black)
        elsif [idx, idx2] == [0,3]
          @grid[idx][idx2] = Queen.new(idx, idx2, self, :white)
        elsif [idx, idx2] == [7,4]
          @grid[idx][idx2] = King.new(idx, idx2, self, :black)
        elsif [idx, idx2] == [0,4]
          @grid[idx][idx2] = King.new(idx, idx2, self, :white)
        elsif idx == 1 && idx == 4
          @grid[1][4] = Queen.new(1, 4, self, :white)
        else
          @grid[idx][idx2] = NullPiece.new(idx, idx2, self, :none)
        end
      end
    end
  end




end

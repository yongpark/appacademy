require_relative "board"
require "colorize"

class Piece
  attr_reader :immediate_moves, :color
  attr_accessor :value, :possible_moves

  def initialize(idx, idx2, board, color)
    @value = ""
    @start_pos = [idx, idx2]
    @possible_moves = []
    @end_pos = []
    @immediate_moves = []
    @color = color
    @board = board
  end

  def move_piece
  end

end

class NullPiece < Piece
  def initialize(idx, idx2, board, color)
    @value = "🀫 "
    @pos = [idx, idx2]
    @color = color
  end
end

module SlidingPiece

  def moves
    @immediate_moves.each do |pos|
      x = @start_pos[0]
      y = @start_pos[1]
      8.times do
        x += pos[0]
        y += pos[1]
        if x < 8 && y < 8 && x >= 0 && y >= 0
          if !@board[[x,y]].color == :none
            # if self.color != @board[[x,y]].color
            #   @possible_moves << [x, y]
            #   break
            # elsif self.color == @board[[x,y]].color
            #   break
            break
      
          else
            @possible_moves << [x, y]
          end
        else
          next
        end
      end
    end
  end
end

module SteppingPiece
  def moves
    @immediate_moves.each do |pos|
      x = @start_pos[0] + pos[0]
      y = @start_pos[1] + pos[1]
      if x < 8 && y < 8 && x >= 0 && y >= 0
        if !@board[[x,y]].value.nil?
          if self.color != @board[[x,y]].color
            @possible_moves << [x, y]
            break
          elsif self.color == @board[[x,y]].color
            break
          end
        else
          @possible_moves << [x, y]
        end
      else
        next
      end
    end
  end
end



class Rook < Piece
  include SlidingPiece
  def initialize(idx, idx2, board, color)
    @pos = [idx, idx2]
    @color = color
    @color == :white ? @value = "♖ " : @value = "♜ "
  end

  def move_dirs
    @immediate_moves = [[0,1], [0, -1], [1, 0], [-1, 0]]
  end
end

class Bishop < Piece
    include SlidingPiece
    def initialize(idx, idx2, board, color)
      @pos = [idx, idx2]
      @color = color
      @color == :white ? @value = "♗ " : @value = "♝ "
    end
    def move_dirs
      @immediate_moves = [[1, 1], [1, -1], [-1, 1], [-1, -1]]
    end
end

class Queen < Piece
    include SlidingPiece
    def initialize(idx, idx2, board, color)
      @pos = [idx, idx2]
      @color = color
      @color == :white ? @value = "♕ " : @value = "♛ "
    end
    def move_dirs
      @immediate_moves  = [[1, 1], [1, -1], [-1, 1], [-1, -1], [0,1], [0, -1], [1, 0], [-1, 0]]
    end
end


class King < Piece
  include SteppingPiece
  def initialize(idx, idx2, board, color)
    @pos = [idx, idx2]
    @color = color
    @color == :white ? @value = "♔ " : @value = "♚ "
  end
  def move_dirs
    @immediate_moves  = [[1, 1], [1, -1], [-1, 1], [-1, -1], [0,1], [0, -1], [1, 0], [-1, 0]]
  end

end

class Knight < Piece
  include SteppingPiece
  def initialize(idx, idx2, board, color)
    @pos = [idx, idx2]
    @color = color
    @color == :white ? @value = "♘ " : @value = "♞ "
  end
  def move_dirs
    @immediate_moves  = [[-1, 2],[-1, -2],[1, 2],[1, -2],[2, -1],[2, 1],[-2, 1],[-2, -1]]
  end
end

class Pawn < Piece
  def initialize(idx, idx2, board, color)
    @pos = [idx, idx2]
    @color = color
    @color == :white ? @value = "♙ " : @value = "♟ "
  end
  def moves
  end
  def move_dirs
    @immediate_moves  = []
  end
end

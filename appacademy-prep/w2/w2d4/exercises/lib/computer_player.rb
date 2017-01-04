class ComputerPlayer

  attr_accessor :name, :board, :mark

  def initialize(name)
    @name = name
  end

  def display(board)
    @board = board
  end

  def get_move
    moves = []
    (0..2).each do |row|
      (0..2).each do |column|
        pos = [row, column]
        moves << pos if board[pos].nil?
      end
    end

    moves.each do |move|
      board[move] = mark
        if board.winner == mark
          board[move] = nil
          return move
        else
          board[move] = nil
        end
    end
    moves.sample
  end

end

require_relative "board"
require_relative "player"

class BattleshipGame
  attr_reader :board, :player

  def initialize(player, board = Board.new)
    @player = player
    @board = board
  end

  def attack(pos)
    @board[pos] = :x
  end

  def count
    @board.count
  end

  def game_over?
    @board.won?
  end

  def fill
    @board.populate_grid
  end

  def play_turn
    "Enter firing coordinates (x, y)"
    guess = player.get_play
    self.attack(guess)
  end

  def play
    self.fill
    player.display(board)

    until self.game_over?
      self.play_turn
      player.display(board)
    end
    if self.game_over?
      puts "Computer wins!"
    end
  end
end

class ComputerPlayer
  attr_accessor :board, :turns

  def initialize(name = "Jim")
    @name = name
    @turns = 0
  end

  def display(board)
    @board = board
  end

  def get_play
    moves = []
    board.grid.each_with_index do |row, idx1|
      row.each_with_index do |col, idx2|
        moves << [idx1, idx2] if col != :x
      end
    end
    @turns += 1
    p turns
    moves.sample
  end
end


if $PROGRAM_NAME == __FILE__

  computer = ComputerPlayer.new
  new_game = BattleshipGame.new(computer)
  new_game.play
end

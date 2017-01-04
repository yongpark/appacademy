require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game

  attr_accessor :current_player, :p1, :p2, :board

  def initialize(p1, p2)
    @board = Board.new
    @p1 = p1
    @p2 = p2
    p1.mark = :X
    p2.mark = :O
    @current_player = p1
  end

  def play_turn
    board.place_mark(current_player.get_move, current_player.mark)
    switch_players!
    current_player.display(board)
  end

  def switch_players!
    if self.current_player == p1
      self.current_player = p2
    else
      self.current_player = p1
    end
  end

  def play
    current_player.display(board)

    until board.over?
      play_turn
    end

    if game_winner
      game_winner.display(board)
      puts "#{game_winner.name} wins!"
    else
      puts "Cat's game"
    end
  end


  def game_winner
    return p1 if board.winner == p1.mark
    return p2 if board.winner == p2.mark
    nil
  end

  if $PROGRAM_NAME == __FILE__

    print "Enter your name: "
    name = gets.chomp
    human = HumanPlayer.new(name)
    garry = ComputerPlayer.new('garry')

    new_game = Game.new(human, garry)
    new_game.play
  end

end

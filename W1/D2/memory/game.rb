require_relative 'card'
require_relative 'board'
require_relative 'player'
require 'byebug'


class Game

  attr_reader :current_player, :players, :board, :score

  def initialize(players, length)
    @players = players
    @board = Board.new(length)
    @score = Hash.new {|h, k| h[k] = 0}
    @current_player = players.first
  end

  def take_turn(player)
    system("clear")
    #@board.reveal_all
    @board.render
    first_guess = player.get_guess(@board)
    player.just_guessed = true
    player.register_value(first_guess, @board[first_guess].face_value)
    @board[first_guess].reveal
    system("clear")
    @board.render
    second_guess = player.get_guess(@board)
    player.just_guessed = false
    @board[second_guess].reveal
    system("clear")
    @board.render
    sleep(3)
    if @board[first_guess].face_value == @board[second_guess].face_value
      @score[player] += 1
      return true
    else
      players.each do |pl|
        pl.register_value(first_guess, @board[first_guess].face_value)
        pl.register_value(second_guess, @board[second_guess].face_value)
      end
      @board[first_guess].hide
      @board[second_guess].hide
      return false
    end
  end

  def switch_players
    @players.rotate!
    @current_player = players.first
  end

  def run_game
    @board.populate
    until @board.won?
      last_move_match = take_turn(current_player)
      while last_move_match
        show_score
        last_move_match = take_turn(current_player)
        if @board.won?
          break
        end
      end
      switch_players
    end
    show_winner
  end

  def show_winner
   winner = @score.max_by {|_, v| v}
   puts "The winner is #{winner[0].name}"
  end

  def show_score
    @score.each {|player, score| puts "#{player.name}'s Score is : #{score}"}
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Game.new([Player.new("Jim"), ComputerPlayer.new], 4)
  game.run_game
end

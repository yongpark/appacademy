class Game

  attr_reader :dictionary, :player1, :player2
  attr_accessor :fragment, :guess


  def initialize(player1, player2, dictionary = File.readlines("dictionary.txt").map(&:chomp))
    @player1 = player1
    @player2 = player2
    @dictionary = dictionary
    @fragment = ""
    @current_player = player1
  end

  def switch_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def play
    until self.over?
      self.play_round
    end
  end

  def play_round
    self.take_turn(@current_player)
    self.valid_play?(@fragment)
    until valid_play?(@fragment) == true
      @current_player.alert_invalid_guess
      self.take_turn(@current_player)
      self.valid_play?(@fragment)
    end
    if self.over? == true
      return "#{@current_player} + 'loses'"
    else
      self.switch_player!
    end
  end

def over?
  if dictionary.include?(@fragment)
    return true
  else
    return false
  end
end

  def take_turn(player)
    @guess = @current_player.guess
    @fragment += @guess
  end

  def valid_play?(string)
    @dictionary.each do |word|
      if word.slice!(0..@fragment.length-1) == @fragment
        return true
      end
    end
    false
  end

end



class HumanPlayers

  attr_accessor :guess
  attr_reader :name, :game

  def initialize(name)
    @name = name
  end

  def guess
    gets.chomp
  end

  def alert_invalid_guess
    "Invalid play, try again. "
  end

end

jim = HumanPlayers.new("jim")
john = HumanPlayers.new("john")
game = Game.new(jim, john)
game.play

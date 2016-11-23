require_relative 'game'

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

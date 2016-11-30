require_relative 'player'

class Dealer < Player
  attr_reader :bets, :name

  def initialize()
    super("dealer", 0)
    @bets = {}
  end

  def place_bet(dealer, amt)
    raise "Dealer doesn't bet"
  end

  def play_hand(deck)
    self.hand
  end

  def take_bet(player, amt)
  end

  def pay_bets
  end
end

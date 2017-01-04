class Deck
  attr_reader :current_deck
  SUITES = ["Spade", "Heart", "Diamond", "Club"]
  VALUES = [2,3,4,5,6,7,8,9,10,11,12,13,14]


  def initialize
    @current_deck = Array.new
    self.build_deck
  end

  def build_deck
    SUITES.each do |suite|
      VALUES.each do |value|
        @current_deck << Card.new(suite, value)
      end
    end
  end

  def shuffle
    @current_deck.shuffle
  end

  def deal_card
    @current_deck.pop
  end
end

require_relative 'card'
SUIT_STRINGS = {
  :clubs    => "♣",
  :diamonds => "♦",
  :hearts   => "♥",
  :spades   => "♠"
}

VALUE_STRINGS = {
  :deuce => "2",
  :three => "3",
  :four  => "4",
  :five  => "5",
  :six   => "6",
  :seven => "7",
  :eight => "8",
  :nine  => "9",
  :ten   => "10",
  :jack  => "J",
  :queen => "Q",
  :king  => "K",
  :ace   => "A"
}

# Represents a deck of playing cards.
class Deck
  # Returns an array of all 52 playing cards.
  def self.all_cards
    card_array = []
    SUIT_STRINGS.each do |suit, value|
      VALUE_STRINGS.each do |number, value|
        card_array << Card.new(suit, number)
      end
    end
    card_array
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  # Returns the number of cards in the deck.
  def count
    @cards.count
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    if n > self.count
      raise "not enough cards"
    end
    taken = []
    i = 0
    while i < n
      taken << @cards.shift
      i += 1
    end
    taken
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    returned = cards.dup
    until returned.empty?
      @cards << returned.shift
    end
  end
end

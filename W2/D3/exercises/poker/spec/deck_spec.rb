require 'deck'

describe 'Deck' do
  let(:deck) { Deck.new }

  describe '#initialize' do
    it "creates a deck of 52 cards " do
    expect(deck.current_deck.length).to eq(52)
    end

    it 'contains 13 spades' do
    suite_arr = deck.current_deck.select {|card| card.suite == "Spade"}
    expect(suite_arr.length).to eq(13)
    end

    it 'contains 4 cards with value 2' do
      value_arr = deck.current_deck.select {|card| card.value == 2}
      expect(value_arr.length).to eq(4)
    end

    it 'each card is unique' do
      # expect().to eq()
    end
  end

  describe '#shuffle' do
    it 'shuffles a deck of cards' do
      a = deck.dup
      expect(deck.shuffle).not_to eq(a)
    end

    it 'length should be 52' do
      expect(deck.shuffle.length).to eq(52)
  end
end

  describe '#deal_card' do
    it 'deals one card' do
      deck.deal_card
      expect(deck.current_deck.length).to eq(51)
    end

    it 'returns the last card' do
      a = deck.current_deck.last
      expect(deck.deal_card).to eq(a)
    end
  end

end

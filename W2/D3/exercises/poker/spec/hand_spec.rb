require 'hand'

describe 'Hand' do
  let(:player1) { double('player', hand: Hand.new) }
  let(:player2) { double('player', hand: Hand.new) }
  let(:hand) { Hand.new }




  describe '#initialize' do
    it "creates an empty hand" do
    expect(hand.current_hand.length).to eq(0)
    end
  end

  describe '#hand_logic' do
    context 'pair' do
      it "returns pair for the player's current hand" do
        player1.hand.current_hand = [["Spade", 2], ["Heart", 2], ["Diamond", 3],
        ["Spade", 14], ["Club", 5]]
      expect(player1.hand.pair).to eq(true)
      end
    end
  #
  #   context 'two pair' do
  #     it "returns two pair for the player's current hand" do
  #       expect().to eq()
  #     end
  #   end
  #
  #   context 'three of a kind' do
  #     it "returns three of a kind for the player's current hand" do
  #       expect().to eq()
  #     end
  #   end
  #
  # describe '#winner' do
  #   context 'no plays left. final reveal.'
  #   it "returns winner of the exposed hands" do
  #   expect().to eq()
  #   end
  #
  end
end

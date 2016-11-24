require 'card.rb'

describe 'Card' do
  let(:new_card) {Card.new("♠", 2)}

  describe '#initialize' do
    it "initializes with a value" do
    expect(new_card.value).to eq(2)
    end

    it 'suite initializes' do
    expect(new_card.suite).to eq("♠")
    end
  end

  describe '#to_s' do
    it "converts card into array of suite & value" do
    expect(new_card.to_s).to eq(["♠", 2])
    end
  end
end



  #
  #
  # describe '#initialize' do
  #   it "" do
  #   expect().to equal()
  #   end
  #
  #   it '' do
  #   expect().to equal()
  #   end
  # end

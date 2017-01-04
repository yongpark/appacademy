require 'tdd.rb'


describe "#my_uniq" do
  let(:array) { [1, 2, 1, 3, 3] }
  let(:uniq_array) { my_uniq(array.dup)}

  it "should remove duplicate elements in the array" do
    expect(uniq_array).to eql([1, 2, 3])
  end

  it "should only have items from the original array" do
    uniq_array.each do |el|
    expect(array).to include(el)
  end
  end
end

describe '#two_sum' do
  let(:array) { [-1, 0, 2, -2, 1] }
  let(:two_sum_result) { two_sum(array)}

  it "should raise an error if input != array" do
  not_array = "not array"
  expect {two_sum(not_array)}.to raise_error("Not an array")
end

  it "should contain pairs of indexes that equal to zero (0)" do
  expect(two_sum_result).to eql([[0, 4], [2, 3]])
end
end


describe '#my_transpose' do
#  let(:rows) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]]}
  let(:transpose_result) { transpose([[0, 1, 2], [3, 4, 5], [6, 7, 8]])}

  it "should raise an error if input != array" do
  not_array = "not array"
  expect {transpose(not_array)}.to raise_error("Not an array")
  end

  it "should flip the row and column indexes for each element" do
  expect(transpose_result).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
  end
end


describe '#stock_picker' do
  let(:stock_picker_result) { stock_picker([5, 10, 20, 15])}

  it "should raise an error if input != array" do
  not_array = "not array"
  expect {stock_picker(not_array)}.to raise_error("Not an array")
  end

  it "should pick a pair of days that has the biggest difference in stock prices" do
  expect(stock_picker_result).to eq([0, 2])
  end
end





describe 'Towers of Hanoi' do
  let(:towers) { TowersOfHanoi.new }

  describe '#initialize' do
    it "should initialize with an array of length == 3 " do
    expect(towers.towers.length).to equal(3)
    end

    it 'should initialize with 3 discs in the first tower' do
    expect(towers.towers[0].length).to equal(3)
    end
  end

  describe "#valid_move?" do
    it 'should return false if empty' do
    expect(towers.valid_move?(2,0)).to be(false)
    end

    it 'should raise an error if input is not an integer' do
    expect{towers.valid_move?("string", 0)}.to raise_error("Not an integer")
    end

    it 'be false when moving a larger disc onto a smaller disc' do
      towers.move(0, 1)
      expect(towers.valid_move?(0,1)).to be(false)
    end
  end

  describe "#move" do
    it 'moves discs from from_tower to to_tower' do
    expect(towers.move(0,1)).to eq([[3,2],[1], []])
    end
  end

  describe '#won' do

    it 'returns true if tower 0 is empty and tower 1 || tower 2 == full' do
      towers.towers = [[],[3,2,1],[]]
      expect(towers.won?).to eq(true)
    end
  end
end

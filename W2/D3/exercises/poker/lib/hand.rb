require 'rspec'

class Hand
  attr_accessor :current_hand

  def initialize
    @current_hand = []
  end

  def two_pair
    matches = Hash.new(0)
    @current_hand.each do |card|
      matches[card[1]] += 1
    end
    final_matches = matches.select { |k, v| v > 1 }
    return true if final_matches.length == 2
  end

  def pair
    matches = Hash.new(0)
    @current_hand.each do |card|
      matches[card[1]] += 1
    end
    final_matches = matches.select { |k, v| v > 1 }
    return true if final_matches.length == 1
  end


end

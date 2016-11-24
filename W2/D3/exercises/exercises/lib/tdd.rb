require 'rspec'
require 'byebug'


def my_uniq(array)
  new_array = []
  array.each do |el|
    new_array << el unless new_array.include?(el)
  end
  new_array
end

def two_sum(array)
  raise "Not an array" if array.class != Array
  empty_arr = []
  array.each_with_index do |el, idx|
    array.each_with_index do |el2, idx2|
      if idx2 > idx
      empty_arr << [idx, idx2] if (el2 + el == 0) && idx2 != idx
      end
    end
  end

  empty_arr
end


def transpose(array)
    raise "Not an array" if array.class != Array
  t = Array.new(array.size) {[]}
  array.each do |row|
    row.each_with_index do |el, y|
      t[y] << el
    end
  end
  t
end

def stock_picker(array)
  raise "Not an array" if array.class != Array
  empty_arr = []
  array.each_with_index do |el, buy_day|
    array.each_with_index do |el2, sell_day|
      if sell_day > buy_day && buy_day != sell_day
        if empty_arr.empty?
          empty_arr << [buy_day, sell_day]
        elsif (array[empty_arr.last[1]] - array[empty_arr.last[0]] ) < (el2-el)
          empty_arr.pop
          empty_arr << [buy_day, sell_day]
        end
      end
    end
  end
  empty_arr.last
end



class TowersOfHanoi

  attr_accessor :towers

  def initialize
    @towers = [[3,2,1], [], []]
  end

  def won?
    if @towers[0].empty? && (@towers[1].length == 3 || @towers[2].length == 3)
      return true
    else
      return false
    end
  end

  def valid_move?(from_tower, to_tower)
    raise "Not an integer" unless from_tower.is_a?(Integer)
    # end
    if @towers[from_tower].empty?
      return false
    end
    if !@towers[from_tower].empty? && (
      @towers[to_tower].empty? ||
      @towers[to_tower].last > @towers[from_tower].last)
      return true
    else
      return false
    end
  end

  def move(from_tower = gets.chomp.to_i, to_tower = gets.chomp.to_i)
    if valid_move?(from_tower, to_tower)
      @towers[to_tower] << @towers[from_tower].pop
    end
      @towers
  end
end

tower = TowersOfHanoi.new
tower.move

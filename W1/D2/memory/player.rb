require 'byebug'
class Player
  attr_reader :name
  attr_accessor :just_guessed

  def initialize(name)
    @name = name
    @just_guessed = false
  end

  def get_guess(board)
    puts "#{name}, please enter coordinates for first guess."
    guess = gets.chomp.split(",").collect(&:to_i).collect { |x| x -= 1 }
    until valid_move?(board, guess)
      puts "Not a valid move"
      puts "Please enter coordinates for first guess."
      guess = gets.chomp.split(",").collect(&:to_i).collect { |x| x -= 1 }
    end
    guess
  end

  def valid_move?(board, guess)
    guess.length == 2 &&
    guess.all? {|el| el.is_a?(Integer)  &&
    el.between?(0, board.length - 1)} &&
    board[guess].up != true
  end

  def register_value(pos, value)
  end
end

class ComputerPlayer < Player

  def initialize(name = "Hal")
    @name = name
    @stored_moves = {}
    @last_guess = nil
  end

  def register_value(pos, value)
    @stored_moves[pos] = value
  end

  def register_match(pos)
    @stored_moves.delete(pos)
    @just_guessed = false
  end

  def get_guess(board)

    # if @just_guessed
    #    if @stored_moves
    # else
    if stored_matched = find_stored_match
      #debugger
      if stored_matched.include?(@last_guess)
        stored_matched -= [@last_guess]
        @stored_moves.delete(@last_guess)
        @last_guess = stored_matched[0]
      end
      @stored_moves.delete(stored_matched[0])
      stored_matched[0]
    else not_checked = []
      board.grid.length.times do |idx|
        board.grid[idx].length.times do |j|
          not_checked << [idx, j] unless board[[idx,j]].up
        end
      end
      not_checked -= @stored_moves.keys
      @just_guessed = true
      @last_guess = not_checked.sample
    end
  end

  def find_stored_match
    @stored_moves.each do |k1, v1|
      @stored_moves.each do |k2, v2|
        next if k1 == k2
        return [k1, k2] if v1 == v2
      end
    end
    false
  end
end


class HumanPlayer < Player

end

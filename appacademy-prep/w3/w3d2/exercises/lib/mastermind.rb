class Code
  attr_reader :pegs
  attr_accessor :board
  PEGS = {
    "B" => :b,
    "G" => :g,
    "O" => :o,
    "P" => :p,
    "R" => :r,
    "Y" => :y
  }

  def initialize(pegs)
    if pegs == nil
      raise "Error"
    end
    @pegs = pegs
    @board = @pegs.map.each {|el| el = nil}
  end

  def self.parse(string)
    pegs = string.split("").map do |letter|
      unless PEGS.has_key?(letter.upcase)
        raise "Error"
      end
      PEGS[letter.upcase]
    end
    Code.new(pegs)
  end

  def self.random
    pegs = []
    4.times { pegs << PEGS.values.sample}
    Code.new(pegs)
  end

  def [](i)
    @pegs[i]
  end

  def exact_matches(code)
    matches = 0
    self.pegs.each_with_index do |peg1, idx1|
      code.pegs.each_with_index do |peg2, idx2|
        if peg1 == peg2 && idx1 == idx2
          @board[idx1] = peg1
          matches += 1
        end
      end
    end
    matches
  end

  def near_matches(code)
    other_color_counts = code.color_count
    near_matches = 0
    self.color_count.each do |color, count|
      next unless other_color_counts.has_key?(color)
      near_matches += [count, other_color_counts[color]].min
    end
    near_matches - self.exact_matches(code)
  end

  def color_count
    color_count = Hash.new(0)
    @pegs.each do |color|
      color_count[color] += 1
    end
    color_count
  end

  def ==(code)
    return false unless code.is_a?(Code)
    self.pegs == code.pegs
  end

end


class Game
  MAX = 10
  attr_reader :secret_code

  def play
    MAX.times do
      guess = get_guess
      if guess == @secret_code
        p "You win!"
        return
      end

      display_matches(guess)
    end

    "You should get better at guessing..."
  end

  def initialize(code = nil)
    if code != nil
      @secret_code = code
    else
      @secret_code = Code.random
    end
  end


  def get_guess
    puts "Guess the code:"
    guess = Code.parse(gets.chomp)
  end

  def display_matches(guess)
    exact_matches = @secret_code.exact_matches(guess)
    near_matches = @secret_code.near_matches(guess)
    p @secret_code.board
    p "You got #{exact_matches} exact matches!"
    p "You got #{near_matches} near matches!"
  end

end

if __FILE__ == $PROGRAM_NAME
  Game.new.play
end

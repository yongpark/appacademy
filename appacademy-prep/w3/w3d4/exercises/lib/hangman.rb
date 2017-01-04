class Hangman
  attr_reader :guesser, :referee, :board

  def initialize(players)
    @guesser = players[:guesser]
    @referee = players[:referee]
    @board = []
  end

  def setup
    @guesser.register_secret_length(@referee.pick_secret_word)
    @board.fill(nil, 0, @referee.pick_secret_word)
  end

  def take_turn
    guess = @guesser.guess
    @referee.check_guess(guess)
    self.update_board
    @guesser.handle_response(guess)
  end

  def update_board
  end



end

class HumanPlayer

end

class ComputerPlayer
  attr_reader :dictionary, :secret_word, :candidate_words
  attr_accessor :register_secret_length, :guess

  def initialize(dictionary)
    @dictionary = dictionary
  end

  def pick_secret_word
    @secret_word = @dictionary.sample
    @secret_word.length
  end

  def check_guess(letter)
    split = @secret_word.chars
    split.each_index.select {|i| split[i] == letter}
  end

  def register_secret_length(length)
    @candidate_words = @dictionary.select { |word| word.length == length }
  end

  def guess(board)
    letters_hash = Hash.new(0)
    @candidate_words.each do |word|
      word.split("").each do |letter|
        letters_hash[letter] += 1
      end
    end
    board.each do |letter|
      letters_hash.delete(letter)
    end
    @guess = largest_hash_key(letters_hash)
  end

  def largest_hash_key(hash)
    max = hash.max_by{|k,v| v}
    max[0]
  end

  def handle_response(guess, matching_index)
    @candidate_words.reject! do |word|
      delete = false
      word.split("").each_with_index do |letter, index|
        if (letter == guess) && (!matching_index.include?(index))
          delete = true
          break
        elsif (letter != guess) && (matching_index.include?(index))
          delete = true
          break
        end
      end
      delete
    end
  end

end

class Hangman
  MAX_GUESSES = 2
  attr_reader :guesser, :referee, :board

  def initialize(players)
    @guesser = players[:guesser]
    @referee = players[:referee]
    @num_remaining_guesses = MAX_GUESSES
    @board = []
  end

  def setup
    @guesser.register_secret_length(@referee.pick_secret_word)
    @board.fill(nil, 0, @referee.pick_secret_word)
  end

  def take_turn
    @guesser.display_board(@board)
    guess = @guesser.guess(@board)
    indices = @referee.check_guess(guess)
    self.update_board(guess, indices)
    @guesser.display_board(@board)
    @num_remaining_guesses -= 1 if indices.empty?
    @guesser.handle_response(guess, indices)
  end

  def update_board(guess, indices)
    indices.each { |index| @board[index] = guess }
  end

  def play
    setup

    while @num_remaining_guesses > 0
      take_turn

      if won?
        p @board
        puts "Guesser wins!"
        return
      end
    end

    puts "Word was: #{@referee.secret_word}"
    puts "Guesser loses!"

    nil
  end

  def won?
    @board.all?
  end
end

class HumanPlayer

  def register_secret_length(length)
    p "Secret is #{length} letters long"
  end

  def guess(board)
    puts "Guess the word:"
    gets.chomp
  end

  def handle_response(guess, response)
    puts "Found #{guess} at positions #{response}"
  end


  def display_board(board)
    p board
  end
end

class ComputerPlayer
  attr_reader :dictionary, :secret_word, :candidate_words
  attr_accessor :register_secret_length, :guess

  def initialize(dictionary)
    @dictionary = dictionary
  end

  def self.player_with_dict_file(dict_file_name)
    ComputerPlayer.new(File.readlines(dict_file_name).map(&:chomp))
  end

  def pick_secret_word
    @secret_word = @dictionary.sample
    @secret_word.length
  end

  def check_guess(guess)
    response = []
    guess.split()"").each_with_index do |letter1, index1|
      @secret_word.split("").each_with_index do |letter2, index2|
        response << index2 if letter1 == letter2
      end
    end

    response
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

if __FILE__ == $PROGRAM_NAME
  # use print so that user input happens on the same line
  print "Guesser: Computer (yes/no)? "
  if gets.chomp == "yes"
    guesser = ComputerPlayer.player_with_dict_file("dictionary.txt")
  else
    guesser = HumanPlayer.new
  end

  print "Referee: Computer (yes/no)? "
  if gets.chomp == "yes"
    referee = ComputerPlayer.player_with_dict_file("dictionary.txt")
  else
    referee = HumanPlayer.new
  end

  Hangman.new({guesser: guesser, referee: referee}).play
end

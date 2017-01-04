# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.


def guessing_game
  number = rand(1..100)
  guesses = 0

  loop do
    puts "Guess a number"
    guess = Integer(gets.chomp)
    guesses += 1
    if guess < number
      puts "#{guess} is too low!"
    elsif guess == number
      puts "You found the number #{guess}!"
      break
    else
      puts "#{guess} is too high!"
    end
  end
  puts "It took you #{guesses} guesses"
end




# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.


def shuffle
  puts "Please enter a file name."
  filename = gets.chomp
  File.open("#{filename}-shuffled.txt", "w") do |line1|
    File.readlines(filename).shuffle.each do |line2|
      line1.puts line2.chomp
    end
  end
end

class HumanPlayer

  def get_play
    gets.chomp.split(",").map(&:to_i)
  end
end

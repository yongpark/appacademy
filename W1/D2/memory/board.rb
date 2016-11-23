class Board
  attr_reader :length, :found, :grid

  require_relative 'card'

  CARDS = ("a".."z").to_a

  def initialize(length = 4)
    @length = length
    @grid = Array.new(length) { Array.new(length) }
    @found = {}
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end

  def render
    top_string = "  "
    (1..length).each { |s| top_string << " #{s} " }
    body = top_string + "\n"
    @grid.each_with_index do |row, i|
      #p row
      current_str = "#{i + 1}|"
      row.each { |el| current_str << el.to_s }
      body << current_str + "\n"
    end
    puts body
  end

  def populate
    num_cards = (@grid.length ** 2) / 2
    symbols_array = ("a".."z").to_a[0...num_cards]
    cards_array = []
    symbols_array.each do |symbol|
      card1 = Card.new(symbol)
      card2 = Card.new(symbol)
      cards_array << card1
      cards_array << card2
    end
    cards_array.shuffle!
    @grid.each do |row|
      row.map! { |el| el = cards_array.pop }
    end
  end

  def won?
    #found.keys.length == (@grid.length ** 2) / 2
    @grid.all? do |row|
      row.all? {|el| el.up == true}
    end
  end

  def reveal_all
    top_string = "  "
    (1..length).each { |s| top_string << " #{s} " }
    body = top_string + "\n"
    @grid.each_with_index do |row, i|
      #p row
      current_str = "#{i + 1}|"
      row.each { |el| current_str << el.face_value.to_s }
      body << current_str + "\n"
    end
    puts body
  end
end



if __FILE__ == $PROGRAM_NAME
  b = Board.new
  b.populate
  b.render
  puts b.won?
end

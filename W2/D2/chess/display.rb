require 'byebug'
require_relative "cursor"
require "colorize"
require_relative "board"
require_relative "piece"

class Display

  def initialize()
    @board = Board.new
    @cursor = Cursor.new([1,4], @board)
  end

  def render
    top = "    "
    body = ""
    (0..7).each do |num|
      top << "#{num} "
    end
    top << "\n"
    body << top
    @board.grid.each_with_index do |row, index|
      body << "#{index} | "
      row.each_with_index do |piece, index2|
        if @cursor.cursor_pos == [index, index2]
          if @cursor.toggle_selected == true
            body << "#{@board[@cursor.cursor_pos].value.colorize(:background => :red)}"
          else
            body << "#{@board[@cursor.cursor_pos].value.colorize(:background => :black)}"
          end
        else
          body << "#{piece.value}"
        end
      end
      body << "\n"
    end
    # @board[@cursor.cursor_pos].value.colorize( :background => :red)
    puts body
    p @board[@cursor.cursor_pos]
    p @board[@cursor.cursor_pos].move_dirs
    p @board[@cursor.cursor_pos].moves
    p @board[@cursor.cursor_pos].possible_moves
  end

  def test_loop
    # debugger
    until @cursor.key == :return || @cursor.key == :space
      render
      @cursor.get_input
      render
    end
  end
end

display = Display.new
display.render

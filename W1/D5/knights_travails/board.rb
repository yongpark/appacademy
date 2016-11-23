require_relative '00_tree_node'

class Board
attr_reader :grid

def new_grid
  Array.new(8) {Array.new(8, PolyTreeNode.new)}
end

def initialize(grid = new_grid)
  @grid = grid
end

def populate
  @grid.each_with_index do |row, idx|
    row.each_with_index do |node,idx2|
      node.value = [idx, idx2]
    end
  end
end

def render
  body = "    "
  (0...grid.length).each do |i|
    body << "#{i} "
  end
  body << "\n"
  @grid.each_with_index do |row, idx|
    body << "#{idx} |"
    row.each do |square|
      body << "#{square.value}" if square.value
    end
    body << "\n"
  end
  puts body
end

def [](pos)
  x, y = pos
  @grid[x][y]
end

def []=(pos, value)
  x, y = pos
  @grid[x][y] = value
end

end

x = Board.new
x.populate
x.render

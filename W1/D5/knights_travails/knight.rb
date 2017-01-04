require_relative '00_tree_node'

class KnightPathFinder
  attr_reader :visited_positions, :root_node

  POSSIBLE_MOVES = [
    [-1, 2],
    [-1, -2],
    [1, 2],
    [1, -2],
    [2, -1],
    [2, 1],
    [-2, 1],
    [-2, -1]
  ]

  def initialize
    @root_node = PolyTreeNode.new([0,0])
    @visited_positions = [[0,0]]
  end

  # def possible_moves(pos = @starting_pos)
  #   @starting_pos.dfs()
  # end

  def create_children
    children = []
    POSSIBLE_MOVES.each do |x, y|

      possible_x = (@root_node.value[0] + x)
      possible_y = (@root_node.value[1] + y)
      if (0..7).to_a.include?(possible_x) &&
        (0..7).to_a.include?(possible_y) &&
        !@visited_positions.include?([possible_x, possible_y])
          children << PolyTreeNode.new([possible_x, possible_y])
          @visited_positions << [possible_x, possible_y]
      end

    end

    children.each do |child|
      @root_node.add_child(child)
    end

  end

  def build_move_tree
    queue = [@root_node]
    until queue.empty?
      @root_node = queue.shift
      create_children
      @root_node.children.each do |child|
        queue << child
      end
    end

    nil
  end



  def find_path(target)
    parent = []
    visited_positions.each do |node|
      if node.value == target
        parent << node
        break
      end
    end
    until parent.include?([0, 0])
      parent.unshift(parent.first.parent.value)
    end

    parent
  end

end

knight = KnightPathFinder.new
knight.build_move_tree
p knight.visited_positions.length
# p knight.find_path([3,3])

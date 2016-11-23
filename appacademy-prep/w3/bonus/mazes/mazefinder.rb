class MazeFinder

MARKS = [:*, :S, :E]

attr_accessor :maze, :mazetrail

  def initialize( maze = File.readlines("maze1.txt"))
    @maze = maze
    @mazetrail = Array.new
  end

  def maze_format
    @maze.map!.each do |line|
      line.split("")
    end
    @maze.map! do |line|
      line.delete("\n")
      line.map! do |el|
        el.to_sym
      end
    end
  end

  def find_start
    @maze.each_with_index do |line, idx1|
      line.each_with_index do |el, idx2|
        @mazetrail << [idx1, idx2] if el == :S
      end
    end
  end

  def find_end
    @maze.each_with_index do |line, idx1|
      line.each_with_index do |el, idx2|
        return [idx1, idx2] if el == :E
      end
    end
  end

  def [](pos)
    row, col = pos
    @maze[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    @maze[row][col] = mark
  end

  def play
    endpoint = find_end
    # if able to go up, go up
    #if not go right
    #if not able to go up or right, go down
    #can't do all 3, go left.
    until self[@mazetrail.last] == :E
      point = @mazetrail.last
      if point != :E && !self.stucktop && !@mazetrail.include?([point[0]-1, point[1]])
        self.up
      elsif point != :E && !self.stuckright && !@mazetrail.include?([point[0], point[1]+1])
        self.right
      elsif point != :E && !self.stuckbottom && !@mazetrail.include?([point[0]+1, point[1]])
        self.down
      elsif point != :E && !self.stuckleft && !@mazetrail.include?([point[0], point[1]-1])
        self.left
      end
    end
    @mazetrail.pop
    @mazetrail.shift
    @mazetrail.each do |point|
      self[point] = :X
    end
  end

  def stucktop
    point = @mazetrail.last
    self[[point[0]-1, point[1]]] == :*
  end

  def stuckbottom
    point = @mazetrail.last
    self[[point[0]+1, point[1]]] == :*
  end

  def stuckright
    point = @mazetrail.last
      self[[point[0], point[1]+1]] == :*
  end

  def stuckleft
    point = @mazetrail.last
    self[[point[0], point[1]-1]] == :*
  end


  def right
    point = @mazetrail.last
    i = 1
    while (point[1]+i) < @maze[0].length
      if !@mazetrail.include?([point[0], point[1]+i]) && !self.stuckright
        @mazetrail << [point[0], point[1]+i]
      elsif self[[point[0], point[1]+ i]] == :*
        break
      elsif point == :E
        break
      end
      i += 1
    end
  end

  def left
    point = @mazetrail.last
    i = 1
    while (point[1]+i) > 0
      if !@mazetrail.include?([point[0], point[1]-i]) && !self.stuckleft
        @mazetrail << [point[0], point[1]-i]
      elsif self[[point[0], point[1]-i]] == :*
        break
      elsif point == :E
        break
      end
      i += 1
    end
  end


  def up
    point = @mazetrail.last
    i = 1
    while (point[0]-i) > 0
      if !@mazetrail.include?([point[0]-i, point[1]]) && !self.stucktop
        @mazetrail << [point[0]-i, point[1]]
      elsif self[[point[0]-i, point[1]]] == :*
        break
      elsif point == :E
        break
      end
      i += 1
    end
  end

  def down
    point = @mazetrail.last
    i = 1
    while (point[0]+i) < @maze.length
      if !@mazetrail.include?([point[0]+i, point[1]]) && !self.stuckbottom
        @mazetrail << [point[0]+i, point[1]]
      elsif self[[point[0]+i, point[1]]] == :*
        break
      elsif point == :E
        break
      end
      i += 1
    end
  end

  def export
    File.open("mazefinder.txt", "w") do |line1|
      @maze.each do |line2|
        line1.puts line2.join("")
      end
    end
  end


 #sym = p self[@mazetrail[0]]
  maze = MazeFinder.new
  maze.maze_format
  maze.find_start
  maze.play
  maze.export
end

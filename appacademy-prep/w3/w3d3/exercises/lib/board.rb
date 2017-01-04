class Board

  attr_reader :grid

    def initialize(grid = self.class.default_grid)
      @grid = grid
    end

    def self.default_grid
      Array.new(10) {Array.new(10)}
    end

    def [](pos)
      row, col = pos
      @grid[row][col]
    end

    def []=(pos, mark)
      row, col = pos
      @grid[row][col] = mark
    end

    def count
      ships = 0
      @grid.each do |row|
        row.each do |col|
          if col == :s
            ships += 1
          end
        end
      end
      ships
    end

    def empty?(pos = nil)
      if pos == nil
        @grid.each do |row|
          row.each do |col|
            if col != nil
              return false
            end
          end
        end
      elsif self[pos] == nil
        return true
      end
  end

    def full?
      @grid.each do |row|
        row.each do |col|
          if col == nil
            return false
          end
        end
      end
      true
    end


    def random_pos
      [rand(grid.length), rand(grid.length)]
    end

    def place_random_ship
      if self.full?
        raise "error"
      end
      pos = random_pos
      until empty?(pos)
        pos = random_pos
      end
      self[pos] = :s
    end

    def won?
      @grid.each do |row|
        row.each do |col|
          if col == :s
            return false
          end
        end
      end
      true
    end

    def populate_grid
      if self.empty?
        5.times do
          pos = random_pos
          self[pos] = :s
        end
      end
    end


end

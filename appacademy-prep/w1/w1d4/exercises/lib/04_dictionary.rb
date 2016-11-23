class Dictionary
  # TODO: your code goes here!
  attr_accessor :entries

  def initialize
    @entries = {}
  end

  def add(entry)
    if entry.is_a?(String)
      @entries[entry] = nil
    elsif entry.is_a?(Hash)
      @entries.merge!(entry)
    end
  end

  def keywords
    @entries.keys.sort { |x, y| x <=> y }
  end

  def include?(entry)
    @entries.has_key?(entry)
  end

  def find(entry)
    @entries.select do |word|
      word.match(entry)
    end
  end

  def printable
    @entries = keywords.map! do |keyword|
      %Q{[#{keyword}] "#{@entries[keyword]}"}
    end
    @entries.join("\n")
  end
end

class RPNCalculator
  # TODO: your code goes here!
  attr_accessor :numbers_array, :value, :tokenized
  OPERATOR = [:-, :+, :*, :/]

  def initialize
    @numbers_array = []
    @value = 0
  end

  def push(num)
    @numbers_array << num
  end

  def plus
    if @numbers_array.empty?
      raise "calculator is empty"
    end
    @numbers_array[-2] = (@numbers_array[-1] + @numbers_array[-2])
    @numbers_array.pop
    @value = @numbers_array[-1]
  end

  def minus
    if @numbers_array.empty?
      raise "calculator is empty"
    end
    @numbers_array[-2] = (@numbers_array[-2] - @numbers_array[-1])
    @numbers_array.pop
    @value = @numbers_array[-1]
  end

  def divide
    if @numbers_array.empty?
      raise "calculator is empty"
    end
    @numbers_array[-2] = (@numbers_array[-2].to_f / @numbers_array[-1])
    @numbers_array.pop
    @value = @numbers_array[-1]
  end

  def times
    if @numbers_array.empty?
      raise "calculator is empty"
    end
    @numbers_array[-2] = @numbers_array[-2].to_f * @numbers_array[-1]
    @numbers_array.pop
    @value = @numbers_array[-1]
  end

  def tokens(string)
    split = string.split
    @tokenized = []
    split.each do |el|
      if OPERATOR.include?(el.to_sym)
          @tokenized << el.to_sym
      else
        @tokenized << el.to_i
      end
    end
    @tokenized
  end

  def evaluate(string)
    @numbers_array = []
    @newarray = tokens(string)
    @newarray.each do |el|
      case el
      when Integer
        @numbers_array << el
      when :-
        right_num = @numbers_array.pop
        left_num = @numbers_array.pop
        @numbers_array << left_num - right_num
      when :+
        right_num = @numbers_array.pop
        left_num = @numbers_array.pop
        @numbers_array << left_num + right_num
      when :*
        right_num = @numbers_array.pop
        left_num = @numbers_array.pop
        @numbers_array << left_num.to_f * right_num
      when :/
        right_num = @numbers_array.pop
        left_num = @numbers_array.pop
        @numbers_array << left_num.fdiv(right_num)
      end
    end
    return @numbers_array[0]
  end

end

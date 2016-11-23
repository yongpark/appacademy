class Timer
  attr_accessor :seconds

  def initialize(seconds = 0)
    @seconds = seconds
  end

  def format(num)
    if num > 10
      "#{num}"
    else
      "0#{num}"
    end
  end

  def hours
    seconds / 3600
  end

  def minutes
    (seconds % 3600) / 60
  end

  def secs
    seconds % 60
  end

  def time_string
    "#{format(hours)}:#{format(minutes)}:#{format(secs)}"
  end
end

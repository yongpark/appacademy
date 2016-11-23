class Fixnum
  NUMNAMES = {
      1000000000000 => "trillion",
      1000000000 => "billion",
      1000000 => "million",
      1000 => "thousand",
      100 => "hundred",
      90 => "ninety",
      80 => "eighty",
      70 => "seventy",
      60 => "sixty",
      50 => "fifty",
      40 => "forty",
      30 => "thirty",
      20 => "twenty",
      19=>"nineteen",
      18=>"eighteen",
      17=>"seventeen",
      16=>"sixteen",
      15=>"fifteen",
      14=>"fourteen",
      13=>"thirteen",
      12=>"twelve",
      11 => "eleven",
      10 => "ten",
      9 => "nine",
      8 => "eight",
      7 => "seven",
      6 => "six",
      5 => "five",
      4 => "four",
      3 => "three",
      2 => "two",
      1 => "one",
      0 => "zero"
    }

    def in_words
    string = ""
    NUMNAMES.each do |num, name|
      if self.to_s.length == 1 && self == num
       return string + "#{name}"
      elsif self < 100 && self/num > 0
       return string + "#{name}" if (self % num) == 0
       return string + "#{name} " + (self%num).in_words
     elsif self > 99 && num < 999 && self % 100 == 0
        return (self/100).in_words + " "+ NUMNAMES[100]
      elsif self == num && num > 99
        return string + "one " + "#{name}"
      elsif self/num > 0
        return string + (self/num).in_words + " " + "#{name}" + " " + (self%num).in_words
      end
    end
  end
end

class Book
  LOWER_CASE = ["the", "a", "an", "and", "in", "of"]

  attr_reader :title

  def title=(title)
    title_words = title.split(" ")

    title_words.map!.with_index do |word, idx|
      if LOWER_CASE.include?(word) && idx != 0
        word
      else
        word.capitalize
      end
    end

    @title = title_words.join(" ")
  end
end

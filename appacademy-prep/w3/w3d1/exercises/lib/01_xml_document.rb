class XmlDocument
  # TODO: your code goes here!

  attr_reader :indents

  def initialize(indent = false)
    @indent = indent
    @indents = 0
  end

  def method_missing(method_name, *attributes, &blk)
    attrs = attributes.first || {}
    make_tag(method_name, attrs, &blk)
  end


  def make_tag(method_name, attrs, &blk)
    string = ""
    if block_given?
      string << "#{start_tag(method_name, attrs)}"
      indent
      string<< blk.call
      unindent
      string << "#{end_tag(method_name)}"
    else
    string << reg_tag(method_name, attrs)
    end
  end

  def start_tag(method_name, attrs)
    attributes = attrs.map { |key, val| "#{key}=\"#{val}\"" }
    if @indent
      "  " * indents + "<#{([method_name] + attributes).join(" ")}>"  +  "\n"
    else
      "  " * indents + "<#{([method_name] + attributes).join(" ")}>"
    end
  end

  def end_tag(method_name)
    if @indent
      "  " * indents + "</#{method_name}>"  +  "\n"
    else
        "  " * indents + "</#{method_name}>"
    end
  end

  def reg_tag(method_name, attrs)
    attributes = attrs.map { |key, val| "#{key}=\"#{val}\"" }
    if @indent
      "  " * indents + "<#{([method_name] + attributes).join(" ")}/>" +  "\n"
    else
      "  " * indents + "<#{([method_name] + attributes).join(" ")}/>"
    end
  end

  def indent
    @indents += 1 if @indent
  end

  def unindent
    @indents -= 1 if @indent
  end
end

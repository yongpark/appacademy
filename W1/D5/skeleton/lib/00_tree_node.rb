class PolyTreeNode
  attr_reader :parent, :children, :value

  def initialize(value = nil)
    @parent = nil
    @children = []
    @value = value
  end

  def parent=(new_parent)

    if @parent != nil
      @parent.children.delete(self)
      @parent = new_parent
      return nil if new_parent.nil?
      new_parent.children << self unless new_parent.children.include?(self)
    else
      @parent = new_parent
      new_parent.children << self unless new_parent.children.include?(self)
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    child_node.parent = nil
  end

  def dfs(target)
    return nil if self.value == nil
    return self if self.value == target
    @children.each do |child|
      search_result = child.dfs(target)
      return search_result if search_result
    end
    nil
  end

  def bfs(target)
    queue = [self]
    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target
      queue += current_node.children
    end

    nil
  end
end

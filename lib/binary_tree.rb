require_relative 'linked_list'

class Node
  attr_accessor :value, :left, :right, :parent
  def initialize(value, left=nil, right=nil, parent=nil)
    @value = value
    @left = left
    @right = right
    @parent = parent
  end
end

class BinaryTree

  attr_accessor :root

  def initialize(array)
    @root
  end

  def add_node

  end

end

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

  def enumerate_array

  end

  def add_child

  end

  def << value
    @root == nil ? @root
  end

end

#       8
#   3      10
# 1   x        y
#
# 6, 14, 4, 7, 3

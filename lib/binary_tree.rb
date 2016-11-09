require_relative 'linked_list'

class Node
  attr_accessor :value, :left_child, :right_child#, :parent
  def initialize(value)
    @value = value
    @left_child
    @right_child
    # @parent
  end
end

class BinaryTree
  attr_accessor :root

  def initialize(array)
    @root = Node.new(array.shift)
    while array.length > 0
      self << array.shift
    end
  end

  def add_child

  end

  def << value
    if value < node.value
      if node.left_child
        node.left_child << value
      else
        node.left_child = Node.new(value)
      end
    elsif value > node.value
      if node.right_child
        node.right_child << value
      else
        node.right_child = Node.new(value)
      end
    elsif value == node
      raise "Duplicate value error"
    end

  end

end

#       8
#   3      10
# 1   x        y
#
# 6, 14, 4, 7, 3

# value = 4
# compare value to root
# root = value if root == nil
# if value < root
#   compare value to root.left_child
# if value > root
#   compare value to root.right_child
# if value == root
#   throw "Duplicate value error"
# end

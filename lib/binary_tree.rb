class Node
  attr_accessor :value, :left_child, :right_child#, :parent
  def initialize(value)
    @value = value
    @left_child
    @right_child
    # @parent
  end

  def << value
    if value < self.value
      if self.left_child
        self.left_child << value
      else
        self.left_child = Node.new(value)
      end
    elsif value > self.value
      if self.right_child
        self.right_child << value
      else
        self.right_child = Node.new(value)
      end
    elsif value == self
      raise "Duplicate value error"
    end
  end

end

class BinaryTree
  attr_accessor :root

  def initialize(array)
    @root = Node.new(array.shift)
    while array.length > 0
       @root << array.shift
    end
  end

  def add_child

  end
end

#       8
#   3      10
# 1   6        y
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

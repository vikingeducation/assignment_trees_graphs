require 'node'

class BinaryTree
  attr_accessor :root

  def initialize(array)
    @root = Node.new(array.shift)
    while array.length > 0
       @root << array.shift
    end
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

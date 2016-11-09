
Node = Struct.new(:left, :right, :data, :visited)

class BinaryTree

  #new binary tree starts with one node, 
  #to add a value, start at the root and compare new value to root
  # if new value is less than root, and the root's left is not nil, 
      #then move to the root's left node
  # if root's left is nil, add a new node to the root's left
  # if new value is more than the root node, same as above -- but on the right

  def initialize data
    #
  end

  def build_tree(data)
    #
  end


end












binary_tree = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])
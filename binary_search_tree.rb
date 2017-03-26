#node struct with left right children
BinaryNode = Struct.new(:left, :right, :data)

class BinaryTree
  attr_accessor :root

  def initialize(array)
	  #sets root node with first element in array
	  @root = BinaryNode.new(nil, nil, array[0])
  end

end

tree = BinaryTree.new([15,1,4,18,6,3,8])

puts tree.root.data


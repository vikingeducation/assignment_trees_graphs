#node struct with left right children
BinaryNode = Struct.new(:left, :right, :data)

class BinaryTree
  attr_accessor :root

  def initialize(array)
  	@array = array
	  #sets root node with first element in array
	  @root = BinaryNode.new(nil, nil, array[0])
  end

  def build_tree
  	#iterate though array and check if goes to left or 
  	#right of root
    @array.each do |x|
      while x < @root.data
        @left_node = BinaryNode.new(:left, :right, :data)
        @left_node.data = x
        puts @left_node.data
      end
    end
  puts   @left_node.data.inspect
  end

end


binary_tree = BinaryTree.new([8,10,3,1,6,14,4,7,13])

binary_tree.build_tree



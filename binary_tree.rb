Node = Struct.new(:left, :right, :data)

class BinaryTree

  attr_reader :root, :visited

  def initialize(array)
    @root = Node.new(nil, nil, array[0])
    @array_length = array.length
    array[1..-1].each {|x| insert(Node.new(nil, nil, x), @root)}
    # @counter
  end

  def insert(node, current_node)
    if node.data > current_node.data
      return current_node.right = node unless current_node.right
      insert(node, current_node.right)
    elsif node.data < current_node.data
      return current_node.left = node unless current_node.left
      insert(node, current_node.left)
    end
  end

end

p binary_tree = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])

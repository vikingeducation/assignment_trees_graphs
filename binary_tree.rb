class BinaryTree
  def initialize(data)
    @data = data
    @root = BinaryNode.new(nil, nil, @data[0])
    @current_node = @root
  end

  def add_children(value)
    if value < @current_node.data
      add_left_child(BinaryNode.new(nil, nil, value))
    elsif value > @current_node.data


    end

    @current_node = @root
  end

  def add_left_child(child_node)
    if @current_node.left.nil?
      @current_node.left = child_node
    else
      @current_node = @current_node.left
      add_children(child_node)
    end
  end

  def add_right_child(parent_node, child_node)
  end
end

# Set up a root node
BinaryNode = Struct.new(:left, :right, :data)
#root_node = BinaryNode.new(nil, nil, "foo")

# Add a left node
#root_node.left = BinaryNode.new(nil, nil, "bar")


test_tree = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])

class BinaryTree
  def initialize(data)
    @data = data
    @root = BinaryNode.new(nil, nil, @data[0])
    @current_node = @root
    generate_tree
  end

  def add_children(value)
    if value < @current_node.data
      add_left_child(BinaryNode.new(nil, nil, value))
    elsif value > @current_node.data
      add_right_child(BinaryNode.new(nil, nil, value))
    else
    end

    @current_node = @root
  end

  def add_left_child(child_node)
    if @current_node.left.nil?
      @current_node.left = child_node
    else
      @current_node = @current_node.left
      add_children(child_node.data)
    end
  end

  def add_right_child(child_node)
    if @current_node.right.nil?
      @current_node.right = child_node
    else
      @current_node = @current_node.right
      add_children(child_node.data)
    end
  end

  def generate_tree
    @data[1..-1].each do |item|
      add_children(item)
    end
  end

  # def render
  #   puts "#{@current_root.value}".center(40, " ")
  #   if value < @current_node.data
  #     print_left_child(BinaryNode.new(nil, nil, value))
  #   elsif value > @current_node.data
  #     print_right_child(BinaryNode.new(nil, nil, value))
  #   else
  #   end

  #   @current_node = @root
  # end

  # def print_left_child(parent_node)
  #   if 
  # end

  # def print_right_child(parent_node)

  # end
end

# Set up a root node
BinaryNode = Struct.new(:left, :right, :data)
#root_node = BinaryNode.new(nil, nil, "foo")

# Add a left node
#root_node.left = BinaryNode.new(nil, nil, "bar")


test_tree = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])

puts "#{test_tree.inspect}"
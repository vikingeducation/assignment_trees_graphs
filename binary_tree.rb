
BinaryNode = Struct.new(:left, :right, :data)

class BinaryTree

  def initialize(array)
    @array = array
    @root = BinaryNode.new(nil, nil, @array[0])
  end


  def add_right_node_if_empty(current_node, data)
    if current_node.right == nil
      current_node.right = BinaryNode.new(nil, nil, data)
      true
    else
      false
    end
  end

  def add_left_node_if_empty(current_node, data)
    if current_node.left == nil
      current_node.left = BinaryNode.new(nil, nil, data)
      true
    else
      false
    end
  end

  def build_tree
    @array[1..-1].each do |item|
      current_node = @root
      loop do
        if item < current_node.data
          add_left_node_if_empty(current_node, item) ? (break) : current_node = current_node.left
        else
          add_right_node_if_empty(current_node, item) ? (break) : current_node = current_node.right
        end
      end
    end

  end

  def print_tree
    code = @root
    code.inspect.each_char {|char| char != "#" ? (print char) : (puts char)}
    return
  end

end

# binary_tree = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])
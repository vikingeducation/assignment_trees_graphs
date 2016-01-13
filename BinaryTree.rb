
 Node = Struct.new(:right, :left, :value) do def display_node
    "#{value}"
  end


class BinaryTree
  def initialize(data_array)
    add_root(data_array[0])
    (1...data_array).each do |index|
      add_node(data_array[index])
    end
  end

  def add_root(value)
    @root = Node.new(nil, nil, value)
  end

  def add_node(node_value)
    current_node = @root
    node_placed = false
    until node_placed
      if move_right?(current_node, node_value)
        side_node(current_node, :right, node_value)
      else
        side_node(current_node, :left, node_value)
      end
    end
  end 

  def move_right?(current_node, node_value)
    current_node.value < node_value    
  end

  def side_node(current_node, side, node_value)
    if current_node.send(side.to_sym) == nil
      new_node = Node.new(nil, nil, node_value)
      current_node.send("#{side}=".to_sym, new_node)
      node_placed = true
      break
    else
      current_node = current_node.send(side.to_sym)
    end
  end

end


binary_tree = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])
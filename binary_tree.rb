require 'pry-byebug'


Node = Struct.new(:right, :left, :value) do
  def display_node
    "#{value}"
  end
end

class BinaryTree
  def initialize(data_array)
    add_root(data_array[0])
    data_array[1..-1].each do |value|
      add_node(value)
    end
    @current_node = @root
  end

  def add_root(value)
    @root = Node.new(nil, nil, value)
  end

  def add_node(node_value)
    @current_node = @root
    node_placed = false
    until node_placed
      side = move_right?(node_value) ? :right : :left
      node_placed = side_node(side, node_value)
    end
  end

  def move_right?(node_value)
    node_value > @current_node.value
  end

  def side_node(side, node_value)
    if @current_node.send(side).nil?
      new_node = Node.new(nil, nil, node_value)
      @current_node.send("#{side}=".to_sym, new_node)
      true
    else
      @current_node = @current_node.send(side)
      false
    end
  end

  def draw_subtree(node, level)
    "#{node.left}#{"  "*level}#{node.right}"

  end
end

binary_tree = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])
puts binary_tree.inspect

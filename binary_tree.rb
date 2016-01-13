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

  def add_node(value)
    current_node = @root
    node_placed = false
    until node_placed
      if move_right?
        if right_node.nil?
          place_node_right(current_node, value)
        else
          current_node = right_node
        end
      else
        if left_node.nil?
          place_node_left(current_node, value)
        else
          current_node = left_node
        end
      end
    end
  end

  def right_node(old_node)
    old_node.right
  end

  def left_node(old_node)
    old_node.left
  end

  def place_node_right(source_node, value)
    source_node.right = Node.new(nil,nil,value)
  end

  def place_node_left(source_node, value)
    source_node.left = Node.new(nil,nil,value)
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

require 'pry'

Node = Struct.new(:left, :right, :data)


class BinaryTree
  attr_accessor :root
  def initialize(array)
    @root = Node.new(nil, nil, array[0])
    array.shift
    @array = array
  end


  def add_node(parent_node, child_node)
    if child_node.data > parent_node.data
      if parent_node.right
        add_node(parent_node.right, child_node)
      else
        parent_node.right = child_node
      end
    else
      if parent_node.left
        add_node(parent_node.left, child_node)
      else
        parent_node.left = child_node
      end
    end
  end


  def build_tree
    @array.each do |num|
      node = Node.new(nil,nil, num)
      add_node(@root, node)
      # @node = node
    end

  end

  def display_tree
    p @root
  end

end

binary_tree = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])
binary_tree.build_tree
binary_tree.display_tree


Node = Struct.new(:value, :left, :right, :visited)

class BinaryTree
  attr_reader :root

  #new binary tree starts with one node,
  #to add a value, start at the root and compare new value to root
  # if new value is less than root, and the root's left is not nil,
      #then move to the root's left node
  # if root's left is nil, add a new node to the root's left
  # if new value is more than the root node, same as above -- but on the right

  def initialize data
    build_tree(data)
  end

  def build_tree(data)
    data.each do |value|
      add_node(value, @root)
    end
  end

  def add_node(value, current_node)
    unless @root
      @root = Node.new(value)
    else
      if value < current_node.value
        if current_node.left.nil?
          current_node.left = Node.new(value)
        else
          add_node(value, current_node.left)
        end
      else
        if current_node.right.nil?
          current_node.right = Node.new(value)
        else
          add_node(value, current_node.right)
        end
      end
    end
  end

  def inspect
    self.value
  end
end












binary_tree = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])

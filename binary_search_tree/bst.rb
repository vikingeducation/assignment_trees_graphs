# bst.rb

Node = Struct.new(:left, :right, :data)

class BST
  attr_reader :root

  def initialize(arr = [])
    @root = Node.new(nil, nil, arr[0])
    arr[1..-1].each { |value| insert(@root, Node.new(nil, nil, value)) }
  end

  def insert(root_node, new_node)
    root_node = new_node if root_node.nil?

    if new_node.data < root_node.data
      if root_node.left.nil?
        root_node.left = new_node
      else
        insert(root_node.left, new_node)
      end
    elsif new_node.data > root_node.data
      if root_node.right.nil?
        root_node.right = new_node
      else
        insert(root_node.right, new_node)
      end
    else
      return
    end
  end

  private

end

# tests

bst = BST.new([5, 4, 1, 6, 3])
p bst


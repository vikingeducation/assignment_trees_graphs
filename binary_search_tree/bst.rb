# bst.rb

Node = Struct.new(:left, :right, :data)

class BST

  def initialize(arr = [])
    @root = nil
    arr.each { |value| insert(@root, Node.new(nil, nil, value)) }
  end

  def insert(root_node, new_node)
    root_node = new_node if root_node.nil?

    if new_node.data < root_node.data
      insert(root_node.left, new_node)
    elsif new_node.data > root_node.data
      insert(root_node.right, new_node)
    else
      return
    end
  end

  private

  def nil?

  end

end

# tests

bst = BST.new([1, 2, 3, 4, 5])

p bst

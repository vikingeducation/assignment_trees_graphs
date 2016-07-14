
node = Struct.new(:left, :right, :data)

class BinaryTree

  def initialize(array)
    @root = node.new(nil, nil, array[0])
    @node = nil
  end

  def add_node


  end

  def build_tree


  end


end

# initialize with root node as array[0]
# array#sort
# array.each do |node|
  add_node(node)
    if node > root
      if !!node
        node.right = node
    else
      node.left = node
    end
    @root = node
end


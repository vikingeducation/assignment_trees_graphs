Node = Struct.new(:left, :right, :data)

class BinaryTree
  def initialize(input)
    @root = Node.new(nil, nil, input[0])
    @print_array = []
    loadtree(input)
  end

  def render
    puts 'Tree: '
    print_node(@root)
  end

  private

  def print_node(node)
    print " #{node.data} "
    print_node(node.left) unless node.left.nil?
    print_node(node.right) unless node.right.nil?
  end

  def loadtree(data)
    (data.length - 1).times do |index|
      add_node(data[index + 1], @root)
    end
  end

  def add_node(data, node)
    return insert_left(data, node) if data < node.data
    return insert_right(data, node) if data > node.data
    false
  end

  def insert_left(data, node)
    return node.left = Node.new(nil, nil, data) if node.left.nil?
    add_node(data, node.left)
  end

  def insert_right(data, node)
    return node.right = Node.new(nil, nil, data) if node.right.nil?
    add_node(data, node.right)
  end
end

binary_tree = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])
binary_tree.render

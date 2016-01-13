Node = Struct.new(:data, :left, :right)

class BinarySearchTree
  def initialize(array)
    @array = array
    @root = nil
  end

  def add_root_node(data)
    @root = Node.new(data)
  end

  def make_tree
    unless @root
      add_root_node(@array.shift)
    end

    while @array.length > 0
      add_node(@array.shift)
    end
  end

  def add_node(data, root_node = @root)
    node = root_node

    if data > node.data
      if node.right
        add_node(data, node.right)
      else
        node.right = Node.new(data)
      end
    else
      if node.left
        add_node(data, node.left)
      else
        node.left = Node.new(data)
      end
    end
  end

  def to_s
    node = @root
    depth = 0

    puts "#{node.data}".rjust(padding)

  end
end

given_array = [8, 10, 3, 1, 6, 14, 4, 7, 13]
our_tree = BinarySearchTree.new(given_array)

our_tree.make_tree

puts our_tree
# >>    8
# >> #<BinarySearchTree:0x007fc629932f78>

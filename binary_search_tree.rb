Node = Struct.new(:data, :left, :right, :depth)

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

  def each_depth
    queue = []
    @root.depth = 0
    queue << @root
    depths = Hash.new { |h,k| h[k] = Array.new }
    current_depth = 0
    while node = queue.shift
      current_depth = node.depth
      if node.left
        node.left.depth = current_depth + 1
        queue << node.left
      end
      if node.right
        node.right.depth = current_depth + 1
        queue << node.right
      end
      depths[node.depth] << node
    end
    depths
  end

  def display_tree
    each_depth.each do |depth, nodes|
      print "#{depth}:"
      nodes.map do |node|
        print " #{node.data}"
      end
      puts
    end
  end
end

given_array = [8, 10, 3, 1, 6, 14, 4, 7, 13]
our_tree = BinarySearchTree.new(given_array)

our_tree.make_tree
our_tree.display_tree
# >> 0: 8
# >> 1: 3 10
# >> 2: 1 6 14
# >> 3: 4 7 13

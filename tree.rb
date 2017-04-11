Node = Struct.new(:data, :left, :right, :depth)
class BinaryTree
  def initialize(arr)
    @arr = arr
    @root = nil
  end

  def add_root_node(data)
    @root = Node.new(data)
  end

  def build_tree
    unless @root
      add_root_node(@arr.shift)
    end
    while @arr.length > 0
      add_node(@arr.shift)
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
    depths = Hash.new { |h, k| h[k] = Array.new}
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

  def print_tree
    each_depth.each do |depth, nodes|
      print "#{depth}:"
      nodes.map do |node|
        print " #{node.data}"
      end
      puts
    end
  end
end
binary_tree = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])
binary_tree.build_tree
binary_tree.print_tree

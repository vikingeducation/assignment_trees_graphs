Node = Struct.new(:data, :left, :right, :depth)

class BinarySearchTree
  attr_reader :root

  def initialize(array)
    @root = build_node(array[0])
    build_tree(array[1..-1])
    render
  end

  def build_tree(array)
    array.each do |item|
      add_node(item)
    end
  end

  def render
    queue = [@root]
    @root.depth = 0
    depths = Hash.new { |hash, key| hash[key] =  [] }
    depths[0] << @root.data
    while node = queue.pop
      if node.left
        node.left.depth = node.depth + 1
        depths[node.left.depth] << node.left.data
        queue.unshift(node.left)
      end
      if node.right
        node.right.depth = node.depth + 1
        depths[node.right.depth] << node.right.data
        queue.unshift(node.right)
      end
    end
      p depths
  end

  def build_node(n)
    Node.new(n, nil, nil)
  end

  def recursive_build_tree(array)
    array.each do |item|
      recursive_add_node(build_node(item), @root)
    end
  end

  private

  def add_node(n)
    current_lvl = @root
    loop do
      if n > current_lvl.data
        if current_lvl.right
          current_lvl = current_lvl.right
        else
          return current_lvl.right = build_node(n)
        end
      else
        if current_lvl.left
          current_lvl = current_lvl.left
        else
          return current_lvl.left = build_node(n)
        end
      end
    end
  end

  def recursive_add_node(node, current_lvl = nil)
    if node.data > current_lvl.data
      if current_lvl.right
        recursive_add_node(node, current_lvl.right)
      else
        current_lvl.right = node
      end
    else
      if current_lvl.left
        recursive_add_node(node, current_lvl.left)
      else
        current_lvl.left = node
      end
    end
  end

end

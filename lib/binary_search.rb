Node = Struct.new(:value, :left, :right, :depth)

class BinaryTree

  attr_accessor :arr

  def initialize(arr)
    @arr = arr
  end

  def create_node(value)
    Node.new(value, nil, nil, nil)
  end

  def check_for_child(current_node, direction)
    direction == "left" ? current_node.left : current_node.right
  end

  def determine_branch(current_node, element)
    current_node.value > element ? 'left' : 'right' 
  end

  def place_child(current_node, element, direction, depth)
    if direction == "left" 
      current_node.left = Node.new(element, nil, nil, depth)
    else
      current_node.right = Node.new(element, nil, nil, depth)
    end
  end

  def render_tree
    root = build_tree
    print_tree(hash_children(root))
  end

    # next elem of array check 
    #   if > 
    #     check for child
    #     if child true current_node = child
    #       compare child and value to determine direction 
    #       check current_node direction
    #   if < call left
    #     while check_for_child
    #       determine branch direction
    #     end

  def build_tree
    root = Node.new(@arr.shift, nil, nil, 0)

    @arr.each do |element|
      depth = 1
      current_node = root
      direction = determine_branch(current_node, element)  

      while !!check_for_child(current_node, direction)
        current_node = check_for_child(current_node, direction)
        direction = determine_branch(current_node, element)
        depth += 1
      end
      
      place_child(current_node, element, direction, depth)
    end
    
    root
  end

  def hash_children(node, depth_hash = Hash.new { |h, k| h[k] = [] })
    return depth_hash if !node
    if depth_hash[node.depth.to_s]
      depth_hash[node.depth.to_s] << node.value
    else
      depth_hash[node.depth.to_s] = []
      depth_hash[node.depth.to_s] << node.value
    end
    left_child = node.left
    right_child = node.right
    hash_children(left_child, depth_hash)
    hash_children(right_child, depth_hash)
  end

  def print_tree(tree_hash)
    tree_hash.each do |depth, nodes|
      puts nodes.join(" ")
    end
  end
    
end

#b = BinaryTree.new([2,3,1])
binary_tree = BinaryTree.new ([8, 10, 3, 1, 6, 14, 4, 7, 13])
binary_tree.render_tree


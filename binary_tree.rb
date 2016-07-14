Node = Struct.new( :data, :left, :right )


class BinaryTree

  attr_reader :input_arr, :root

  def initialize(arr)
    @input_arr = arr
    @root = Node.new( @input_arr.shift )
    build_tree
  end

  def add_node( arr, root )
    node = Node.new( arr.shift )
    node.data < root.data ? root.left = node : root.right = node
  end

  def find_leaf( element, root )
    if root.data > element
      return root if root.left == nil
      find_leaf(element, root.left)
    else
      return root if root.right == nil
      find_leaf(element, root.right)
    end
  end

  def build_tree
    
    until @input_arr.empty?
      add_node(@input_arr, find_leaf(@input_arr[0], @root))
    end

  end



end

b = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])
puts b.root.right.right.left.data


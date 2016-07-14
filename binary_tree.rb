Node = Struct.new( :data, :left, :right )

class BinaryTree

  def initialize(arr)
    @input_arr = arr
    @root = Node.new( data: @input_arr.shift )
  end

  def add_node( arr, root )
    node = Node.new( data: arr.shift )
    node.data < root.data ? root.left = node : root.right = node
  end

  def find_leaf( arr, root )
    return root if root.data.is_nil?
    root.data > element ? find_leaf(arr, root.left) : find_leaf(root.right)

    if root.data > element
      return root if root.left == nil
      find_leaf(element, root.left)
    elsif
      return root if root.right == nil
  end
end

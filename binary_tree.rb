Node = Struct.new(:left, :right, :data)

class BinaryTree

  attr_accessor :root

  def initialize(array)
    @root = Node.new(nil, nil, array[0])
    array[1..-1].each {|x| insert(Node.new(nil, nil, x))}
    @counter
  end

  def insert(node)
    current_node = @root
    loop do
      if node.data > current_node.data
        if current_node.right == nil
          return current_node.right = node
        else
          current_node = current_node.right
          counter += 1
        end
      elsif node.data < current_node.data
        if current_node.left == nil
          return current_node.left = node
        else
          current_node = current_node.left
        end
      end
    end
  end

  def render(node)
    unless node == nil
      p render(node.left)
      p render(node.right)
    end
  end





end

p binary_tree = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])

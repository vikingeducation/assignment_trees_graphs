Node = Struct.new(:left, :right, :data)

class Node
  def inspect
    "#{data}: #{left}, #{right}"
  end
end

class BinaryTree
  attr_accessor :root

  def initialize(array)
    @root = Node.new(nil, nil, array[0])
    @current = @root
    add_all_nodes(array[1..-1])
  end

  def add_all_nodes(array)
    array.each do |data|
      add_node(data)
    end
  end

  def add_node(data)
    node = Node.new(nil, nil, data)
    loop do
      if node.data < @current.data && @current.left.nil?
        @current.left = node
        break
      elsif node.data < @current.data && !@current.left.nil?
        @current = @current.left
      elsif node.data > @current.data && @current.right.nil?
        @current.right = node
        break
      elsif node.data > @current.data && !@current.right.nil?
        @current = @current.right
      end
    end
    @current = @root
    p @root
  end
end

BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])
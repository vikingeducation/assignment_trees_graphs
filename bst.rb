require 'pry'
Node = Struct.new(:data, :left, :right)
class BinaryTree
  attr_accessor :root
  def initialize(arr)
    @root = nil
    arr.each do |item|
      insert(root, item)
    end
  end

  def insert(node, data)
    new_node = Node.new(data, nil, nil)
    if node.nil?
      @root = new_node
    else
      if (data < node.data)
        node.left.nil? ? node.left = new_node : insert(node.left, data)
      else
        node.right.nil? ? node.right = new_node : insert(node.right, data)
      end
    end
  end

  def simple_output(node)
    if !node.nil?
      puts "#{node.data}"
      simple_output(node.left)
      simple_output(node.right)
    end
  end

  def height(node)
    if node.nil?
      return 0
    else
      lheight = height(node.left);
      rheight = height(node.right);
      lheight > rheight ? lheight+1 : rheight+1
    end
  end

  def print_level_order(root)
    height = height(root)
    (1..height).each do |i|
      print " "*4*(height-i)
      print_given_level(root, i, i*2)
      puts " "*(height-i)
    end
  end

  def print_given_level(root, level, indent)
    return if root.nil?
    if level == 1
        print root.data
        print " "*indent
    elsif level > 1
        print_given_level(root.left, level-1, indent);
        print_given_level(root.right, level-1, indent);
    end
  end
end

binary_tree = BinaryTree.new([8, 10, 9, 3, 1, 6, 14])
# binary_tree.simple_output(binary_tree.root)
binary_tree.print_level_order(binary_tree.root)

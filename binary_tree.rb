Node = Struct.new(:left, :right, :value)

class BinaryTree
  attr_accessor :current_node, :root
  def initialize
    @root = nil
    @current_node = nil
  end

  # def construct_tree_from_array(array)
  #
  # end

  # if root nil add root
  def add_node(value)
    @current_node = @root
    return add_root(value) if @root.nil?
    loop do
      if @current_node.value < value
        if @current_node.right.nil?
          @current_node.right = create_node(value)
          break
        else
          @current_node = @current_node.right
        end
      else
        if @current_node.left.nil?
          @current_node.left = create_node(value)
          break
        else
          @current_node = @current_node.left
        end
      end
    end
  end

  def create_node(value)
    Node.new(nil, nil, value)
  end

  def add_root(value)
    @root = Node.new(nil, nil, value)
  end

  def import(array)
    array.each {|x| add_node(x)}
  end

  def bf_read(nodes)
    children = []
    return nil if nodes.all? {|x| x.nil?}
    nodes.each do |node|
      if node.nil?
        children << [nil, nil]
      else
        children << gather(node)
      end
    end
    children.flatten!
    puts "#{nodes.inspect}"
    bf_read(children)
  end

  def gather(node)

    return [node.left, node.right]
  end

end

class Node
  def inspect
    value
  end
end

t = BinaryTree.new
t.add_node(5)
t.add_node(2)
t.add_node(1)
t.add_node(4)
t.add_node(7)
t.add_node(9)
t.add_node(6)
t.add_node(10)
t.add_node(11)
t.add_node(12)



t.bf_read([t.root])

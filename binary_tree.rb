Node = Struct.new(:left, :right, :value)

class BinaryTree
  attr_accessor :current_node, :root
  def initialize
    @root = nil
    @current_node = nil
  end

  def construct_tree_from_array(array)

  end

  # if root nil add root
  def add_node(value)
    @current_node = @root
    return add_root(value) if @root.nil?
    loop do
      return_value = left_or_right?(value)
      if @current_node.send(return_value).nil?
        node = create_node(value)
        @current_node.send(equalfy(return_value), node)
        break
      else
        @current_node = @current_node.send(return_value)
      end
    end
  end

  def equalfy(symbol)
    :left ? :left= : :right=
  end

  def left_or_right?(value)
    return :right if value > @current_node.value
    return :left if value < @current_node.value
  end

  def create_node(value)
    Node.new(nil, nil, :value)
  end

  def add_root(value)
    @root = Node.new(nil, nil, value)
  end
end

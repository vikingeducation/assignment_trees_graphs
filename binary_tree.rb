class BinaryTree
  Node = Struct.new(:value, :left, :right)

  attr_reader :root

  def initialize(values = nil)
    @root = nil

    values.each { |value| add(value) } unless values.nil?
  end

  # adds a value into the BinaryTree
  def add(value)
    if @root.nil?
      @root = Node.new(value, nil, nil)
      return @root
    end

    current_node = @root
    while (current_node)
      if value <= current_node.value
        if current_node.left.nil?
          current_node.left = Node.new(value, nil, nil)
          return current_node.left
        else
          current_node = current_node.left
        end
      else
        if current_node.right.nil?
          current_node.right = Node.new(value, nil, nil)
          return current_node.right
        else
          current_node = current_node.right
        end
      end
    end
  end

  # prints out the BinaryTree
  def render
  end
end

Node = Struct.new(:value, :left, :right)

class BinaryTree
  def initialize(numbers)
    @root = nil
    numbers.each do |number|
      insert(number)
    end
  end

  def insert(number)
    if @root.nil?
      add_root(number)
    else
      node = nodify(number)
      add_node(node)
    end
  end
  
  def nodify(number)
    Node.new(number, nil, nil)
  end

  def add_root(number)
    @root = nodify(number)
  end

  def add_node(node)
    current_node = @root
    parent = nil
    until current_node.nil?
      parent = current_node
      if node.value < current_node.value
        current_node = current_node.left
      else
        current_node = current_node.right
      end
    end

    node.value < parent.value ? parent.left = node : parent.right = node
  end

end

p t = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])
Node = Struct.new(:data, :left, :right)

class BinarySearchTree
  attr_reader :root

  def initialize(array)
    @root = build_node(array[0])
    # order array here
  end

  def build_node(n)
    Node.new(n, nil, nil)
  end

  def add_node(n)
    current_lvl = @root
    loop do
      if n > current_lvl.data
        if current_lvl.right
          current_lvl = current_lvl.right
        else
          return current_lvl.right = build_node(n)
        end
      else
        if current_lvl.left
          current_lvl = current_lvl.left
        else
          return current_lvl.left = build_node(n)
        end
      end
    end
  end

end

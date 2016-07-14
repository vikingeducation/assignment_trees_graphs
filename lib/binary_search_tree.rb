Node = Struct.new(:data, :left, :right)

class BinarySearchTree
  attr_reader :root

  def initialize(array)
    @root = build_node(array[0])
    array.shift

  end

  def build_tree(array)
    array.each do |item|
      add_node(item)
    end
  end

  def build_node(n)
    Node.new(n, nil, nil)
  end

  def recursive_build_tree(array)
    array.each do |item|
      recursive_add_node(build_node(item), @root)
    end
  end

  private

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

    def recursive_add_node(node, current_lvl = nil)
      if node.data > current_lvl.data
        if current_lvl.right
          recursive_add_node(node, current_lvl.right)
        else
          current_lvl.right = node
        end
      else
        if current_lvl.left
          recursive_add_node(node, current_lvl.left)
        else
          current_lvl.left = node
        end
      end
    end

end

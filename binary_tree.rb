Node = Struct.new(:value, :left, :right)

class BinaryTree
  
  def initialize(array)
  	@array = array
    @root = nil
  end

  def build_tree

    if @root.nil?
      set_root_node(@array.shift)
    end

    while @array.length > 0
      add_node(@array.shift)
    end

  end

  def set_root_node(value)

    @root = Node.new(value)

  end

  def add_node(value, current_node = @root)

    if value < current_node.value
      if current_node.left.nil?
        current_node.left = Node.new(value) 
      else 
        add_node(value, current_node.left)
      end
    else 
      if current_node.right.nil? 
        current_node.right = Node.new(value) 
      else 
        add_node(value, current_node.right)
      end
    end

	end

	def display_tree
    current_node = @root
     
    puts "#{current_node}"
	end

end

b = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])
b.build_tree
b.display_tree

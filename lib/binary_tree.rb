
Node = Struct.new(:left, :right, :data)

class BinaryTree

attr_accessor :arr, :root

  def initialize(arr)
    @arr = arr
    create_tree
  end

  def create_tree
    @arr.each do |val|
      add_node(val)
    end
  end

  # To add the first node
  def add_root_node(value)
    @root = Node.new(nil, nil, value)
  end

   # Add a node 
  def add_node(value)
    if @root.nil?
      add_root_node(value)
    else
      new_node = Node.new(nil, nil, value)
      update_node_pos(new_node)
    end
  end


  def update_node_pos(new_node)
    # start at the root
    new_value = new_node.data
    current_node = @root


    while(current_node.left != new_node && current_node.right != new_node)
      if(new_value < current_node.data)
        if(current_node.left.nil?)
          current_node.left = new_node
          puts "added a left node with value #{new_value}"
        else
          current_node = current_node.left
        end
      else
         if(current_node.right.nil?)
          current_node.right = new_node
          puts "added a right node with value #{new_value}"
        else
          current_node = current_node.right
        end
      end
    end
  end



   # Prints the list
  def print_tree
    return nil if root.nil?
    @root.inspect
  end

end

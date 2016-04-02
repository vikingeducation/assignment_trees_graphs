Node = Struct.new(:data, :left, :right)

class BinaryTree
  def initialize array
    @root = Node.new(array.shift, nil, nil)
    create array
  end

  def create array
    array.each do |node|
      current_node = @root
      added = false
      until added
        if current_node.data > node
          if current_node.left.nil?
            current_node.left = Node.new(node, nil, nil)
            added = true
          else
            current_node = current_node.left
          end

        else
          if current_node.right.nil?
            current_node.right = Node.new(node, nil, nil)
            added = true
          else
            current_node = current_node.right
          end
        end

      end
      puts "#{node} added to the tree"
    end
  end

  def print_tree(node = @root)
    puts node.data

    unless node.left.nil?
      print "/"
      unless node.right.nil?
        print "\\\n"
      end
      print_tree node.left
      unless node.right.nil?
        print_tree node.right      
      end
    end
    if node.left.nil? && !node.right.nil?
      unless node.right.nil?
        puts "\\"
        print_tree node.right      
      end
    end
  end
end

binary_tree = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])
binary_tree.print_tree 











# require 'pry-byebug'

Binary_Node = Struct.new(:value, :left, :right)

#binary_tree = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])

class BinaryTree

  attr_accessor :root

  def initialize( binary_node = nil  ) 
    @root = binary_node
  end

  def add_first_node(value)
    @root = Binary_Node.new(value,nil,nil)
    puts "Adding First"
  end 

  def add_node(value)
  
    if @root.nil?
        add_first_node(value)
    else
    
      current_node = @root

      loop do
        
        if value < current_node.value && current_node.left.nil?
           current_node.left = Binary_Node.new(value,nil,nil)
           puts "Inserting #{value} to the left of #{current_node.value}"
           break
        elsif value > current_node.value && current_node.right.nil?  
          current_node.right = Binary_Node.new(value,nil,nil)
          puts "Inserting #{value} to the right of #{current_node.value}"
          break
        elsif value < current_node.value
          current_node = current_node.left
          puts "Current Node value #{current_node.value}"
        elsif value > current_node.value
          current_node = current_node.right  
        end    
      end
    end
  end

  def print_tree

    # initialize first node to root
    # loop do
      # start pushing current node into the array as a queue? [8]
      # start pushing it's children [3, 10]
      # for each children check it's children [1,6] for 3 and [nil, 14] for 10
      # for [4,7] for 6, [13,nil] for 14
      # [[8]]
      # [[3,10]]
      # [[1,6],[nil,14]]
      # [[nil,nil],[4,7],[13,nil]]

    tree = [@root]

    until tree.empty?
      tree.each do |child|

        # puts "this should be child value #{child.value}"

        print child.value
        tree = []

        print "\n"
        if child != nil
          if child.left != nil
            tree << child.left
          else
            tree << nil
          end

          if child.right != nil
            tree << child.right
          else
            tree << nil
          end
        end
      end
    end
  end
end





bt = BinaryTree.new
bt.add_node(8)  
bt.add_node(3)  
bt.add_node(10)
bt.add_node(1)
bt.add_node(6)
bt.add_node(4)  
bt.add_node(7)




bt.print_tree
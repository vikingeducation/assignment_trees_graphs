
require 'pry-byebug'

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

end

bt = BinaryTree.new
bt.add_node(8)  
bt.add_node(3)  
#bt.add_node(10)
#bt.add_node(1)  
#bt.add_node(6)  
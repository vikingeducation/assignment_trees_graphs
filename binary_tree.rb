require_relative './edge_list.rb'

Node = Struct.new(:value, :left, :right) 

class BinaryTree
  attr_reader :nodes

  def initialize(data_array)
    @head = set_head(data_array)
    @data_array = data_array #can be removed
    @nodes = [@head]
    populate_nodes
  end

  def set_head(data_array)
    @head = Node.new(data_array[0], nil, nil)
  end

  def populate_nodes
    @data_array.each_with_index do |value, index|
      if index != 0
        new_node = Node.new(value, nil, nil)      
        current_node = @head

        until current_node.nil?
          save_node = current_node
          if value <= current_node.value
            current_node = current_node.left
            direction = "l"
          else
            current_node = current_node.right
            direction = "r"
          end
        end

        if direction == "l"
          save_node.left = new_node
        else
          save_node.right = new_node
        end

        @nodes << new_node
        
        current_node = new_node
      
      end
    end
  end

  def display_nodes
    @nodes.each do | node |
     
      left_value = (  node.left ? node.left.value : "nil" )
      right_value = (  node.right ? node.right.value : "nil" )
      puts "#{node.value}, #{left_value}, #{right_value}" 

    end
  end

end

bin = BinaryTree.new(["3", "1", "4", "1", "5", "9", "2", "6", "5", "3", "5", "8", "9", "7", "9", "3", "2", "3", "8", "4", "6"])

bin.display_nodes



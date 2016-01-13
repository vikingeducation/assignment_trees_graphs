require_relative './edge_list.rb'

Node = Struct.new(:value, :left, :right)

class BinaryTree
  attr_reader :nodes

  def initialize(data_array)
    @head = set_head(data_array)
    @data_array = data_array #can be removed
    @nodes = [@head]
    populated_nodes
  end

  def set_head(data_array)
    @head = Node.new(data_array[0], nil, nil)
  end

  def populated_nodes
    @data_array.each_with_index do |value, index|
      if index != 0
        new_node = Node.new(value, nil, nil)      
        current_node = @head
        while !current_node.nil?
          save_node = current_node
          if value <= @head.value
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
        current_node = new_node
        @nodes << new_node
      end
    end
  end


end

bin = BinaryTree.new(["3", "1", "4", "1", "5", "9", "2", "6", "5", "3", "5", "8", "9", "7", "9", "3", "2", "3", "8", "4", "6"])

print bin.nodes
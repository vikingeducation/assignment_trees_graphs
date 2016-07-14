#adjacency_list.rb
require_relative 'edge_list'
require_relative 'linked_list'

class AdjacencyList
  attr_reader :arr

  def initialize(list)
    @arr = Array.new(20) { LinkedList.new }
    @list = list
  end

  def build
    @list.each do |row|
      # row[0] is the 1st, row[1] is the 2nd, row[2] is weight
      @arr[row[0].id].add_node([row[1], row[2]])
    end
  end

  def render
    #arr [linkedlists]
    @arr.each do |list|
      # current list of nodes in array form [[data], node]
      current_list = list.return_all_nodes
      current_list.each do |node|
        print "#{node.data[0].name}(#{node.data[1]}), "
      # look at list of nodes and print.
      end
      puts
    end
  end

  def edge_weight(from_id, to_id)
    current_node = @arr[from_id].head
    data = nil
    
    #this could instead be a block method 'iterate'
    until current_node.nil?
      if current_node.data[0].id == to_id
        data = current_node.data[1]
        break
      else
        current_node = current_node.next
      end
    end

    puts data ? "the weight is: #{data}" : "sorry, no connection found bruh"
  end
end

#testing
a = AdjacencyList.new(EDGE_LIST)
a.build
#a.render
a.edge_weight(1,10)
a.edge_weight(0,10)


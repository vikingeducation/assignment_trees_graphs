require_relative "edge_list.rb"
require_relative "linked_list.rb"

class AdjacencyList

  def initialize(edge_list)
    @edge_list = edge_list
    @people_count = edge_list.people.length
    @id_list = Array.new(@people_count)
    @people = edge_list.people
  end

  def fill_list
    @edge_list.each do |edge|
      if @id_list[edge[0].id]
        @id_list[edge[0].id] = LinkedList.new
      else
        #append to linked_list
      end
    end
  end
end

# Set up the structure
el = EdgeList.new( 10, 4 )
al = AdjacencyList.new( el )

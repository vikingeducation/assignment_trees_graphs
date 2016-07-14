require_relative 'edge_list'

class AdjacencyList

  def initialize(edge_list)
    @adj_list=Array.new(20){LinkedList.new}
    edge_list.each do |edge|
    end
  end

end

#Node=Struct.new(:person,:weight)
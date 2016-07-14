#[LL,LL]
require 'edge_list'

Node = Struct.new(:id, :name, :next_node)

class AdjacencyList
  def initialize(edge_list)
    @edge_list = edge_list
    @array = Array.new(20) { nil }
    populate_list
  end


  def populate_list
    @edge_list.each do |edge|
      origin = edge[0]
      dest = edge[1]
    end
  end
end
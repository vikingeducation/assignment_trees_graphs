require_relative 'edge_list'
require_relative 'linked_list'
class AdjacencyList
  def initialize(edge_list)
    @edges = edge_list
  end

  def build_adj_list
    @edges.length.times do |i|
      @adj_list = (@edges[i][0]).id
    end
  end

  def print_adj_list
    @adj_list.each do |i|
      puts i
    end
  end

  def edge_weight(first_id, second_id)
    puts @adj_list[first_id][second_id]
  end

end
al = AdjacencyList.new(EDGE_LIST)
al.print_adj_list
al.edge_weight(1, 2)

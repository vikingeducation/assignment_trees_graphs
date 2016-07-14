require_relative 'edge_list'

class AdjacencyMatrix

  def initialize
    @matrix = Array.new(20) {Array.new(20) { 'X' } }
  end


  def build_matrix
    EDGE_LIST.each do |edge|
        @matrix[(edge[0].id)][(edge[1].id)] = edge[2] 
    end
  end

  def print_matrix
    p @matrix
  end



end
a = AdjacencyMatrix.new
a.build_matrix
a.display_matrix
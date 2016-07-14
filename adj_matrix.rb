require_relative './edge_list'


class AdjacencyMatrix
  attr_reader :list

  def initialize(list)
    @list = list
  end

  def convert_edge_list
    edj_matrix = Array.new(19){Array.new(19)}
    @list.each do |connection|
      edj_matrix[connection[0].id - 1][connection[1].id - 1] = connection[2]
    end
    edj_matrix
  end

  def print_matrix
    p convert_edge_list
  end
end

a = AdjacencyMatrix.new(EDGE_LIST)
a.print_matrix
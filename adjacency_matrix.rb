require_relative './edge_list'

class AdjacencyMatrix
  attr_reader :matrix

  def initialize(edge_list = nil)
    @matrix = []

    build_matrix(edge_list) unless edge_list.nil?
  end

  def print_matrix
  end

  def edge_weight(from, to)
  end

  private

  def build_matrix(edge_list)
    edge_list.each do |edge|
      from = edge[0]
      to = edge[1]
      weight = edge[2]

      @matrix[from.id] = [] if @matrix[from.id].nil?
      @matrix[from.id][to.id] = weight
    end
  end
end

if __FILE__ == $0
  am = AdjacencyMatrix.new(EDGE_LIST)
  p am
end

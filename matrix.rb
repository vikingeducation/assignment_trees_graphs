require_relative 'edge_list'

class AdjacencyMatrix

  attr_accessor = :matrix

  def initialize(edges)
    @matrix = Array.new
    build_matrix(edges)
  end

  def build_matrix(edges)
    edges.each do |edge|
      x, y, weight = edge[0].id, edge[1].id, edge[2]
      @matrix[x][y] = weight
      @matrix[y][x] = weight
    end
    @matrix
  end

  def render
    @matrix
  end

end

el = EdgeList.new(5,3).list
am = AdjacencyMatrix.new(el)
am.render

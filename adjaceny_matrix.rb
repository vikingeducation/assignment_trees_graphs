class AdjacenyMatrix

  def initialize(edge_list)
    @matrix = Array.new(edge_list.length) { Array.new(edge_list.length) {nil} }
    @edge_list = edge_list
  end

  def populate_matrix
    @edge_list.each do |edge|
      row = edge[0].id
      col = edge[1].id
      weight = edge[2]
      @matrix[row][col] = weight
    end

  end

end
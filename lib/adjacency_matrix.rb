class AdjacencyMatrix

  def initialize(edge_list)
    @edge_list = edge_list
  end

  def get_dimensions(edge_list)
    ids = []

    edge_list.each do |edge|
      ids << edge[0].id
      ids << edge[1].id
    end

    ids.max
  end

  def matrix(edge_list)
    matrix = Array.new(6) do 
     # arr[0][0]

    end 
    edge_list.each do |edge|
      #get orgin, get destination, get weight
      # set matrix[origin][destin] = weight
    end
  end

  def print_matrix
    # outputs as a matrix of names with an X
    # if there is no edge 
  end

  def edge_weight

  end


end

# am = AdjacencyMatrix.new( EDGE_LIST )

class AdjacencyMatrix

  def initialize(edge_list)
    @edge_list = edge_list
    generate_matrix(edge_list)
  end

  def generate_matrix
    empty_matrix = generate_empty_matrix
  end

  def generate_empty_matrix
    number_of_vertices = vertices.length
    # confirm array is returned
    Array.new(number_of_vertices) do
      Array.new(number_of_vertices)
    end
  end

  def vertices

  end

end

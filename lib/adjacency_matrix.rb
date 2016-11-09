require_relative "edge_list"
class AdjacencyMatrix

  def initialize(edge_list = EDGE_LIST)
    @edge_list = edge_list
    @matrix = generate_matrix
  end

  def generate_matrix
    empty_matrix = generate_empty_matrix
    fill_matrix(empty_matrix)
  end

  def fill_matrix(matrix)
    @edge_list.each do |edge|
      first_index = edge[0].id
      second_index = edge[1].id
      edge_length = edge[2]
      matrix[first_index][second_index] = edge_length
    end
    matrix
  end

  def render
    @matrix.each_with_index do |row, index|
      row = row.map { |element| element.nil? ? "_" : element }
      puts "#{ index }: #{ row.join(" ") }"
    end
  end

  def generate_empty_matrix
    number_of_vertices = vertices.length
    # confirm array is returned
    Array.new(number_of_vertices) do
      Array.new(number_of_vertices)
    end
  end

  def vertices
    vertices = @edge_list.flatten.uniq
    vertices.select! {|element| element.is_a?(Person)}
  end

  def sorted_vertices
    vertices.sort_by {|element| element.id}
  end
end

a = AdjacencyMatrix.new
a.render

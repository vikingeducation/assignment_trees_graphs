require_relative './edge_list'

class AdjacencyMatrix
  attr_reader :matrix,
              :lookup

  def initialize(edge_list = nil)
    if edge_list
      # we first build a lookup table mapping ids to names
      @lookup = {}
      build_lookup(edge_list)

      # based on the highest id number, we know the number of
      # vertices, and initialize the matrix accordingly with nil values
      num_vertices = @lookup.keys.max + 1
      @matrix = Array.new(num_vertices) { Array.new(num_vertices) }

      # and now we set the edge weights
      build_matrix(edge_list)
    else
      @lookup = nil
      @matrix = nil
    end
  end

  def print_matrix
    output = ""
    output << build_column_headers

    @matrix.length.times do |row_num|
      output << build_row(row_num)
    end

    puts output
  end

  def edge_weight(from, to)
    if @matrix[from][to].nil?
      puts "That edge does not exist."
      nil
    else
      @matrix[from][to]
    end
  end

  def show_stats
    puts
    # print out number of vertices. O(n).
    show_num_vertices

    puts
    # print out list of people with most edges. O(n).
    show_most_connected_vertices

    puts
    # print out list of people with strongest connected vertices. O(n).
    show_strongest_connected_vertices
  end

  private

  def build_matrix(edge_list)
    edge_list.each do |edge|
      from = edge[0]
      to = edge[1]
      weight = edge[2]

      @matrix[from.id][to.id] = weight
    end
  end

  def build_lookup(edge_list)
    from_hash = {}
    to_hash = {}

    edge_list.each do |edge|
      from = edge[0]
      to = edge[1]

      from_hash[from.id] = from.name
      to_hash[to.id] = to.name
    end

    @lookup = from_hash.merge(to_hash)
  end

  def build_column_headers
    column_headers = ""
    sorted_keys = @lookup.keys.sort
    sorted_keys.each { |key| column_headers << "#{@lookup[key]},"}

    column_headers[0..-2] << "\n"
  end

  def build_row(row_num)
    # add Person's name to the row
    row = ""
    row << "#{@lookup[row_num]},"

    # now print out edge weights per row
    @matrix[row_num].each do |edge_weight|
      if edge_weight.nil?
        row << 'x,'
      else
        row << "#{edge_weight},"
      end
    end

    row[0..-2] << "\n"
  end

  # O(n)
  def show_num_vertices
    puts "Number of vertices: #{self.lookup.keys.length}"
  end

  # O(n), as we need to iterate through each row for each source vertex
  # to determine the number of edges that vertex has
  def show_most_connected_vertices
    degrees = {}
    self.matrix.each_with_index { |vertex, i| degrees[self.lookup[i]] = find_degree(vertex)}

    puts "The list of people with the top 3 most connected vertices are: "
    3.times do
      current_max_degree = degrees.values.max
      while degrees.key(current_max_degree)
        puts "#{degrees.key(current_max_degree)} - #{current_max_degree} edges"
        degrees.delete(degrees.key(current_max_degree))
      end
    end
  end

  # O(n), as we need to iterate through each row for each source vertex to
  # determine the sum of edge weights
  def show_strongest_connected_vertices
    edge_weights = {}
    self.matrix.each_with_index { |vertex, i| edge_weights[self.lookup[i]] = sum_edge_weights(vertex) }

    puts "The list of people with the top 3 strongest connected vertices are: "
    3.times do
      current_max_weight = edge_weights.values.max
      while edge_weights.key(current_max_weight)
        puts "#{edge_weights.key(current_max_weight)} - #{current_max_weight} weight"
        edge_weights.delete(edge_weights.key(current_max_weight))
      end
    end
  end

  # finds the degree of a particular vertex (row in the matrix)
  def find_degree(vertex)
    vertex.count { |edge| !edge.nil? }
  end

  # sums the weights of edges of a particular vertex (row in the matrix)
  def sum_edge_weights(vertex)
    sum = 0
    vertex.each { |degree_weight| sum += degree_weight unless degree_weight.nil? }

    sum
  end
end

if __FILE__ == $0
  am = AdjacencyMatrix.new(EDGE_LIST)
  am.print_matrix
  am.show_stats
end

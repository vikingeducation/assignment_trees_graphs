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

  def edge_weight(from, to); end

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
end

if __FILE__ == $0
  am = AdjacencyMatrix.new(EDGE_LIST)
  am.print_matrix
end

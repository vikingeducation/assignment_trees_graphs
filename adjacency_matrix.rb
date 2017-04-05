require_relative 'edge_list'
class AdjacencyMatrix
  def initialize(edge_list)
    @edges = edge_list
  end

  def build_adj_matrix
    @adj_matrix = []
    (@edges.length).times do |i|
      @adj_matrix[@edges[i][0].id][@edges[i][1].id] = @edges[i][2]
    end
  end

  def print_matrix
    print "        "
    @adj_matrix.each do |header|
      print @adj_matrix[header.name]
    end
    puts
    @adj_matrix.each do |row|
      print @adj_matrix[row.name]
      @adj_matrix.each do |cell|
        print @adj_matrix[row][cell]
      end
    end
    puts
  end

  def edge_weight(first_id, second_id)
    puts @adj_matrix[first_id][second_id]
  end
end
am = AdjacencyMatrix.new( EDGE_LIST)
am.build_adj_matrix
am.print_matrix

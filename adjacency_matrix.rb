require_relative 'edge_list.rb'

class AdjacencyMatrix
  def initialize(edge_list)
    @edge_list = edge_list.list
    @matrix = Array.new(edge_list.people.length) {Array.new(edge_list.people.length)}
  end

  def fill_matrix
    @edge_list.each do |edge|
      @matrix[edge[0].id][edge[1].id] = edge[2]
      @matrix[edge[1].id][edge[0].id] = edge[2]
    end
  end

  def print_matrix
    @matrix.each do |row|
      print "#{row} \n"
    end
  end
end

el = EdgeList.new( 4 )
am = AdjacencyMatrix.new( el )
am.fill_matrix
am.print_matrix
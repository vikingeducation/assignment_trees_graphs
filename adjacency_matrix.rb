require_relative 'edge_list'

class AdjacencyMatrix

  def initialize(edge_list)
  	@edge_list = edge_list
    @vertices_list = list_vertices
    @matrix = create_matrix
  end

  def list_vertices
    @edge_list.each_with_object({}) do |connection, table|
      connection[0..1].each do |vertex|
        unless table[vertex.id]
          table[vertex.id] = vertex
        end
      end
    end
  end

  def create_matrix
    matrix = Array.new(@vertices_list.length){ Array.new(@vertices_list.length) }
    
    @edge_list.each do |vertex|
      person_from, person_to, weight = *vertex
      matrix[person_from.id][person_to.id] = weight
    end

    matrix

  end

  def print_matrix 
    @matrix.each_with_index do |el, index| 
    	puts
    	print "#{index}: #{el}"
    	puts
    end
  end

end

am = AdjacencyMatrix.new( EDGE_LIST )
am.print_matrix

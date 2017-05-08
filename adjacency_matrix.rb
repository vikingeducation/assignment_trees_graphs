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
    printable_matrix = "\t"
    (0...@vertices_list.length).each do |id|
      printable_matrix += "#{@vertices_list[id].name}\t"
    end
    printable_matrix += "\n"

    @matrix.each_with_index do |row, i|
      printable_matrix += "#{@vertices_list[i].name}\t"
      printable_matrix += row
                            .map { |weight| weight.nil? ? 'X' : weight }
                            .join("\t")
      printable_matrix += "\n"
    end

    puts printable_matrix

  end

  def edge_weight(id_from, id_to) 
    puts "#{@matrix[id_from][id_to]}"
  end


end

am = AdjacencyMatrix.new( EDGE_LIST )
am.edge_weight(1, 0) # => 9

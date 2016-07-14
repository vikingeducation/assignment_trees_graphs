require_relative 'edge_list'

class AdjacencyMatrix
  attr_reader :matrix
  def initialize(edge_list)
    @matrix = Array.new(19) { Array.new(19) {nil} }
    
    @edge_list = edge_list
    populate_matrix
  end

  def populate_matrix
    @edge_list.each do |edge|
      row = edge[0].id - 1
      col = edge[1].id - 1
      weight = edge[2]
      @matrix[row][col] = weight
    end
    @matrix
  end

  def print_matrix
    names = ""
    p name_to_id(5)
    name = 1
    @matrix.each do |row|
      row_string = "#{name_to_id(name)}"
      name += 1
      row.each do |col|
        
        if col == nil
          row_string << ' X '
        else
          if col.to_s.length == 1
            row_string << " " << col.to_s << " "
          else
            row_string << " " << col.to_s
          end
        end
      end
      puts row_string
    end
  end

  def name_to_id(id)
    name_to_id = Hash.new

    EDGE_LIST.each do |edge|
      (0..1).each do |person|
        id_tracker = edge[person].id
        name = edge[person].name

        name_to_id[id_tracker] = name
      end
    end
    name_to_id[id]
  end

end

p AdjacencyMatrix.new(EDGE_LIST).print_matrix
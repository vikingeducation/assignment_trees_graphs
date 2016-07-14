require_relative 'edge_list'

class AdjacencyMatrix
  attr_reader :matrix
  def initialize(edge_list)
    @matrix = Array.new(20) { Array.new(20) {nil} }
    
    @edge_list = edge_list
    populate_matrix
  end

  def populate_matrix
    @edge_list.each do |edge|
      row = edge[0].id
      col = edge[1].id 
      weight = edge[2]
      @matrix[row][col] = weight
    end
    @matrix
  end

  def print_matrix
    names = "        "
    (0..19).each do |id|
      names << "#{name_to_id(id)} "
    end
    
    name = 0
    puts "DESTINATION".center(9 * 20)
    puts names
    @matrix.each do |row|
      row_string = "#{name_to_id(name)}"
      
      name += 1
      row.each do |col|
        
        if col == nil
          row_string << 'X'.center(9)
        else
          row_string << col.to_s.center(9)
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
    name = name_to_id[id]
    
    name.center(8)
  end

  def edge_weight(origin, destination)
    @matrix[origin][destination]
  end

end

 a = AdjacencyMatrix.new(EDGE_LIST)
 a.print_matrix
p a.edge_weight(1,4)

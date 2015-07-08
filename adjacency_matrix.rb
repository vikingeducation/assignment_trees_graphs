require_relative "./edge_list.rb"

class AdjacencyMatrix

  def initialize(edge_list)
    @edge_list = edge_list
    size = count_vertices
    @matrix = Array.new(size){Array.new(size){0}}
  end

  def count_vertices
    used_ids = []
    @edge_list.each do |n|
      used_ids << n[0].id unless used_ids.include?(n[0].id)
      used_ids << n[1].id unless used_ids.include?(n[1].id)
    end
    used_ids.length
  end

  def add_weights
    @edge_list.each do |edge|
      @matrix[edge[0].id-101][edge[1].id-101] = edge[2]
    end
  end

  def print_matrix
    @matrix.each_with_index do |row, i|
      row.each_with_index do |col, y|
        print @matrix[y][i]
        print "   "
      end
      puts
    end
  end

end

# edge = [p1, p2, weight]
# p = (id, name, email)
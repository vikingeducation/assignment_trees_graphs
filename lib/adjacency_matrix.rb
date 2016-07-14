require_relative "../edge_list"

class AdjacencyMatrix

  def initialize(list)
    @edge_list = list
    @matrix = Array.new(20){Array.new(20)}
  end

  def build_matrix
    @edge_list.each do |pair|
      @matrix[pair[0].id][pair[1].id] = pair[1]
      @matrix[pair[1].id][pair[0].id] = pair[0]
    end
  end

  def print_matrix
    @matrix.each do |row|
      print "| "
      row.each do |item|
        if item.nil?
          print "X".ljust(3)
        else
          print "#{item.id}".ljust(3)
        end
      end
      print "| "
      puts
    end
  end

end

adj = AdjacencyMatrix.new(EDGE_LIST)
adj.build_matrix
adj.print_matrix

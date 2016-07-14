require_relative './edge_list'

class AdjacencyMatrix
  attr_reader :list

  def initialize(list)
    @list = list
  end

  def convert_edge_list
    @edj_matrix = Array.new(20){Array.new(20)}
    @list.each do |connection|
      @edj_matrix[connection[0].id][connection[1].id] = connection[2]
      #@edj_matrix[connection[1].id - 1][connection[0].id - 1] = connection[2]
    end
    @edj_matrix
  end

  def print_matrix
    width = 8
    convert_edge_list

    puts
    puts "ORIGIN".center(width * @edj_matrix.size)
    @edj_matrix.size.times do |col|
      print "DEST".center(width) if col == 0
      print "#{NAMES[col]}".center(width)
    end
    puts

    @edj_matrix.size.times do |row|
      print "#{NAMES[row]}".center(width)
      @edj_matrix.size.times do |col|
        if @edj_matrix[col][row].nil?
          print "X".center(width)
        else
          print " #{ @edj_matrix[col][row] } ".center(width)
        end
      end
      puts
    end

  end


  def edge_weight(origin, destination)
    @edj_matrix[origin][destination]
  end
end

a = AdjacencyMatrix.new(EDGE_LIST)
a.print_matrix
p a.edge_weight(2,7)
p a.edge_weight(1,4)
p a.edge_weight(1,5)
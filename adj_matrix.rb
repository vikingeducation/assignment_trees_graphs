require_relative './edge_list'
NAMES = {
  1 => 'Harry',
  2 =>  'Sally',
  3 =>  'Sam',
  4 => 'Michael',
  5 => 'Michelle',
  6 => 'Alok',
  7 => 'Dan',
  8 => 'Nick',
  9 => 'Olga',
  10 => 'Alice',
  11 => 'Donald',
  12 => 'Garrett',
  13 => 'Xin',
  14 => 'Mike',
  15 => 'Adam',
  16 => 'Peter',
  17 => 'Andur',
  18 => 'Tom',
  19 => 'Boris',
}

class AdjacencyMatrix
  attr_reader :list

  def initialize(list)
    @list = list
  end

  def convert_edge_list
    @edj_matrix = Array.new(19){Array.new(19)}
    @list.each do |connection|
      @edj_matrix[connection[0].id - 1][connection[1].id - 1] = connection[2]
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
      print "#{NAMES[col + 1]}".center(width)
    end
    puts

    @edj_matrix.size.times do |row|
      print "#{NAMES[row + 1]}".center(width)
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
    @edj_matrix[origin - 1][destination - 1]
  end
end

a = AdjacencyMatrix.new(EDGE_LIST)
a.print_matrix
p a.edge_weight(2,7)
p a.edge_weight(1,4)
p a.edge_weight(1,5)
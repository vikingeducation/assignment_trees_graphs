require_relative "edge_list.rb"
require 'pry-byebug'

PEOPLE_LIST = {
  0 => 'Bob',
  1 => 'Harry',
  2 => 'Sally',
  3 => 'Sam',
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
  19 => 'Boris'
}

class AdjacencyMatrix
  attr_accessor :adj_matrix
  def initialize (lists)
    @adj_matrix = []
    set_matrix lists
  end

  def set_matrix lists
    lists.each do |connection|
      row = connection[0].id
      col = connection[1].id
      if @adj_matrix[row].nil?
        @adj_matrix[row] = []
        @adj_matrix[row][col] = connection[2]
      else
        @adj_matrix[row][col] = connection[2]
      end
    end
  end

  def print_matrix
    # binding.pry
    print ''.ljust(7)
    Array(0..19).each do |num|
      person = PEOPLE_LIST[num]
      print person.center(7)
    end
    puts ''
    @adj_matrix.each_with_index do |row, index|
      person = PEOPLE_LIST[index]
      print person.ljust(10)
      Array(0..19).each do |num|
        row = [] if row.nil?
        print row[num].nil? ? 'X'.ljust(7) : row[num].to_s.ljust(7)
      end
      puts ''
    end
  end


  def edge_weight(from, to)
    @adj_matrix[from][to]
  end
end

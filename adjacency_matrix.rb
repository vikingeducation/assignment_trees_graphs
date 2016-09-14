require_relative 'edge_list.rb'

class AdjacencyMatrix
  attr_accessor :matrix

  def initialize(elist)
    @list = elist
    @array = []
    @matrix = nil
    @people = []
  end

  def generate_array
    @list.each do |edge|
      @array << [edge[0].id, edge[1].id, edge[2]]
      @people << [edge[0].name]
      @people << [edge[1].name]
    end
    @people.uniq!
  end

  def build_matrix
    @matrix = Array.new(@people.count){Array.new(@people.count)}
    @array.each do |edge|
      @matrix[edge[0]][edge[1]] = edge[2]
    end
  end

  def print_matrix
    print ''.ljust(8)
    (0..19).each do |num|
      person = @people[num][0]
      print person.center(7)
    end
    puts
    @matrix.each_with_index do |row, index|
      person = @people[index][0]
      print person.ljust(8)
      row.each do |col|
        if col.nil?
          print "X".center(7)
        else
          print col.to_s.center(7)
        end
      end
      puts
    end
  end

  def edge_weight(origin, destination)
    puts @matrix[origin][destination]
  end
end

am = AdjacencyMatrix.new(EDGE_LIST)
am.generate_array
am.build_matrix
am.print_matrix
am.edge_weight(1, 4)
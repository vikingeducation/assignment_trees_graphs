require_relative 'edge_list'

class AdjacencyMatrix

  attr_accessor = :matrix, :people

  def initialize(edges, people)
    @matrix = Array.new(people.length) { Array.new(people.length)}
    @people = people
    build_matrix(edges)
  end

  def build_matrix(edges)
    edges.each do |edge|
      x, y, weight = edge[0].id, edge[1].id, edge[2]
      @matrix[x][y] = weight
      @matrix[y][x] = weight
    end
    @matrix
  end

  def print_matrix
    print "\t"
    @people.each do |person|
      print "#{person.name}\t"
    end
    puts
    @matrix.each_with_index do |row, index|
      print "#{@people[index].name}\t"
      row.each do |edge|
        if edge.nil?
          print "X\t"
        else
          print "#{edge}\t"
        end
      end
      puts
    end
  end

  def edge_weight(from, to)
    puts @matrix[from][to]
  end

end

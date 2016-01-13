require_relative 'edge_list.rb'

class AdjacencyMatrix
  def initialize(edge_list)
    @edge_list = edge_list.list
    @people_count = edge_list.people.length
    @matrix = Array.new(@people_count) {Array.new(@people_count)}
    @people = edge_list.people
  end

  def fill_matrix
    @edge_list.each do |edge|
      @matrix[edge[0].id][edge[1].id] = edge[2]
      @matrix[edge[1].id][edge[0].id] = edge[2]
    end
  end

  def print_matrix
    print "\t"
    (0...@people_count).each { |index| print "#{ @people[index].name }\t" }
    print "\n"
    (0...@people_count).each do |row|
      print "#{ @people[row].name }\t"
      (0...@people_count).each do |col|
        element = @matrix[row][col]
        element.nil? ? (print "X\t") : (print "#{element}\t")
      end
      print "\n"
    end

  end
end

el = EdgeList.new( 4 )
am = AdjacencyMatrix.new( el )
am.fill_matrix
am.print_matrix

require_relative 'edge_list'
require 'pry'

class AdjacencyMatrix
  attr_reader :matrix

  def initialize(edge_list, num_people = 5)
    @edge_list = edge_list
    @matrix = matrixify(edge_list, num_people)
  end

  def print_matrix
    # Column labels
    print " " * 9
    @edge_list.people.each{|person| print person.name.ljust(9)}
    print "\n"

    # Rows
    @matrix.each_with_index do |row, index|
      print  @edge_list.people[index].name.ljust(9)
      row.each do |col|
        value = ''
        col.nil? ? value = 'X' : value = col.to_s
        print value + ' ' * 8
      end
      print "\n"
    end
  end

  def edge_weight(from, to)
    @matrix[from][to]
  end

  private

  def matrixify(edge_list, num_people)
    matrix = Array.new(num_people){ Array.new(num_people) }
    edge_list.list.each do |edge|
      row_id = edge[0].id
      col_id = edge[1].id
      matrix[row_id][col_id] = edge[2]
    end

    matrix
  end
end

e = EdgeList.new
e.print_list
a = AdjacencyMatrix.new(e)
a.print_matrix
puts a.edge_weight(0,2)
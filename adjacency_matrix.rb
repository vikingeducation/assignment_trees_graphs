require_relative "edge_list.rb"

element = EdgeList.new(3)

class AdjacencyMatrix

  def initialize(element)

    @list = element
    @matrix = []

  end

  def print_matrix

    p @list

  end

  def create_matrix

    @list.each do |connection|

      

    end

  end

end

matrix = AdjacencyMatrix.new(element)
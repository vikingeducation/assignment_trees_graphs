

require_relative './edge_list.rb'

class AdjacencyMatrix
    
    def initialize(edges)
        @edges = edges.list
        @size = @edges.length
        @matrix = Array.new(size) { Array.new(size) } 
    end

    def print_matrix

    end


end

el = EdgeList.new( 4 )
am = AdjacencyMatrix.new( el )




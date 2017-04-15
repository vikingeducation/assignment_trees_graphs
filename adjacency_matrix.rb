require_relative 'edge_list'

class AdjacencyMatrix

	def initialize(edge_list)
    @matrix = Array.new(19) { Array.new(19) {"-"}}
		@edge_list = edge_list
	end

	def build
		@edge_list.each do |edge|
			@matrix[edge[0].id][edge[1].id] = edge[2]
		end
	 @matrix
	end

	def print_matrix
		print @matrix
	end

end

matrix = AdjacencyMatrix.new(EDGE_LIST)

matrix.build
matrix.print_matrix

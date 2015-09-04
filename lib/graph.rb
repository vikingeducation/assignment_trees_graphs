require_relative 'adjacency_list.rb'
require_relative 'adjacency_matrix.rb'
require_relative 'edge_list.rb'

class Graph
	attr_accessor :edge_list
	attr_reader :adjacency_matrix, :adjacency_list

	def initialize(edge_list=nil)
		self.edge_list = edge_list
	end

	def edge_list=(value)
		@edge_list = value || EdgeList.new
		@adjacency_list = AdjacencyList.new(@edge_list)
		@adjacency_matrix = AdjacencyMatrix.new(@edge_list)
	end

	def to_s
		[@adjacency_list, @adjacency_matrix, @edge_list].join("\n\n")
	end
end
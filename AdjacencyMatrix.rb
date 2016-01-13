require_relative 'edge_list'

e = EdgeList.new(4).list

class AdjacencyMatrix

	def initialize(edgelist)
		@list = edgelist
		@matrix = Array.new(max_id) { Array.new(max_id) }
		@names = {}
		p edgelist
	end

	def max_id
		max_num = []
		@list.each do |edge|
			from, to, weight = edge
			max_num << from.id
			max_num << to.id
		end
		max_num.max + 1
	end

	def construct_matrix
		@list.each do |edge|
			from, to, weight = edge
			@matrix[from.id][to.id] = weight
			@matrix[to.id][from.id] = weight
			@names[from.id] = from.name
			@names[to.id] = to.name
		end
	end

	def print_matrix
		@matrix.each_with_index do |row, index1|
			row.each_with_index do |col, index2|
				value = @matrix[index1][index2]
				if value
					print "#{value} "
				else
					print "X "
				end
			end
			puts
		end
	end

	def inspect
		@matrix
	end

end

am = AdjacencyMatrix.new(e)
am.construct_matrix
am.print_matrix
p am
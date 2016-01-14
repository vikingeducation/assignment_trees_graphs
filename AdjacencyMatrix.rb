require_relative 'edge_list'
require 'rainbow'

e = EdgeList.new(10).list

class AdjacencyMatrix

	def initialize(edgelist)
		@list = edgelist
		@matrix = Array.new(max_id) { Array.new(max_id) }
		@names = {}
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

	def longest_name
		lengths = []
		@names.each do |id, name|
			lengths << name.length
		end
		lengths.max
	end

	def print_matrix
		print " " * (longest_name+1)
		@matrix.each_index do |id|
			if @names[id]
				print @names[id].ljust(longest_name+1)
			else
				print "Alien".ljust(longest_name+1)
			end
		end
		puts

		@matrix.each_with_index do |row, index1|
			if @names[index1]
				print @names[index1].ljust(longest_name+1)
			else
				print "Alien".ljust(longest_name+1)
			end
			row.each_with_index do |col, index2|
				value = @matrix[index1][index2]
				if value
          print Rainbow("#{value}".ljust(longest_name+1)).red
				else
					print "X".ljust(longest_name+1)
				end
			end
			puts
		end
	end

	def inspect
		@matrix
	end

	def edge_weight(from, to)
		puts @matrix[from][to]
	end

end

am = AdjacencyMatrix.new(e)
am.construct_matrix
am.print_matrix
# puts e
am.edge_weight(2,1)

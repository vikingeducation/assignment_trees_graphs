require_relative 'edge_list'
require 'colorize'

class AdjucencyMatrix

	attr_accessor :adj_matrix

	def initialize(edge_list)
		@edges_array = edge_list
		biggest_id = find_biggest_id
		@adj_matrix = Array.new(biggest_id+1) { Array.new(biggest_id+1, nil) }
		@person_lut = []
		create_adj_matrix
	end
	def find_biggest_id
		biggest_id = 0
		@edges_array.each do |edge|
			origin = edge[0]
			destination = edge[1]
			weight = edge[2]
			if origin.id > biggest_id
				biggest_id = origin.id
			end
			if destination.id > biggest_id
				biggest_id = destination.id
			end
		end
		biggest_id
	end

	def create_adj_matrix
		@edges_array.each do |edge|
			origin = edge[0]
			destination = edge[1]
			weight = edge[2]
			#p "Edge with weight #{weight} seen from #{origin.id} to #{destination.id}"
			x = origin.id
			y = destination.id
			@person_lut[x] = origin.name
			@person_lut[y] = destination.name
			if(@adj_matrix[x])
				@adj_matrix[x][y] = weight
			else
				@adj_matrix[x] = Array.new
				@adj_matrix[x][y] = weight
			end
		end
	end

	def edge_weight(id_origin, id_destination)
		puts "Not found" if @adj_matrix[id_origin][id_destination].nil?
		@adj_matrix[id_origin][id_destination]
	end

	def print_matrix
		print "        "
		@person_lut.each do |name|
			print name.center(10)
		end
		puts

		@person_lut.each_with_index do |name, id|
			print name.ljust(9)
			@adj_matrix[id].each do |weight|
				if weight.nil?
					print 'X'.center(10).blue
				else
					print weight.to_s.center(10).green
				end
			end
			puts
		end
	end
end

am = AdjucencyMatrix.new(EDGE_LIST)
matrix = am.adj_matrix
#am.print_matrix
p am.edge_weight(1,2)
require_relative 'linked_list'
require_relative 'edge_list'
require 'colorize'

class AdjucencyList

	attr_accessor :adj_list

	def initialize(edge_list)
		@edges_array = edge_list
		biggest_id = find_biggest_id
		@adj_list = Array.new(biggest_id+1) { LinkedList.new }
		@person_lut = []
		create_adj_list
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

	def create_adj_list
		@edges_array.each do |edge|
			origin = edge[0]
			destination = edge[1]
			weight = edge[2]
			x = origin.id
			y = destination.id
			@person_lut[x] = origin.name
			@person_lut[y] = destination.name
			@adj_list[x].add_node(weight,x,y)
		end
	end

	def print_adj_list
		@person_lut.each_with_index do |name, id|
			print name.ljust(10).blue
			edge = @adj_list[id].head
			loop do
				break if edge.nil?
				x = edge.oid
				y = edge.did
				weight = edge.weight
				print "#{@person_lut[y]}(#{weight})".center(15).green
				edge = @adj_list[id].find_next(edge)
			end
			puts
		end
	end

	# It's actually O(d), worst case O(n) and typically O(1)

	def edge_weight(oid, did)
		cur_edge = @adj_list[oid].head
		loop do
			break if cur_edge.nil?
			if cur_edge.did == did
				return cur_edge.weight
			end
			cur_edge = @adj_list[oid].find_next(cur_edge)
		end
		puts "Not Found"
	end

end

al = AdjucencyList.new(EDGE_LIST)
al.print_adj_list
p al.edge_weight(8,7)
p al.edge_weight(2,7)
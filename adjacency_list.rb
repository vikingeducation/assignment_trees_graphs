require_relative 'link_list'
require_relative 'edge_list'

class AdjacencyList
	attr_accessor :list, :bucket

	def initialize
		@list = list
		@bucket = Array.new(19)
		
	end

	def build
		@list.each do |from, to, weight|
			if @list[from.id]
				@list[from.id].add_node(to.id, to.name, weight)
			else
				@list[from.id] = LinkedList.new(Node.new(from.id, from.name, weight))
				@list[from.id].add_node(to.id, to.name, weight)
			end

		end

	end

	def print_adj_list
		@list.each do |list|
			if list.nil?
				puts ("-")
			else
				current_node = list.head
				print "#{current_node.head}"
			end
		end

	end

	def edge_weight
	end
end

al = AdjacencyList.new(EDGE_LIST)

al.build
al.print_adj_list
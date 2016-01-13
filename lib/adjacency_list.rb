require_relative 'list_node.rb'
require_relative 'linked_list.rb'

class AdjacencyList
	attr_accessor :edge_list
	attr_reader :list, :lookup

	def initialize(edge_list)
		self.edge_list = edge_list
	end

	def edge_list=(value)
		@edge_list = value
		build_lookup
		build_list
	end

	def print_adj_list
		lines = [" -- Adjacency List -- "]
		@list.each_with_index do |l, i|
			line = []
			line << "#{i}. #{@lookup[i].name}: ".ljust(@longest_name + 5)
			line << l ? "#{l}" : 'X'
			lines << line.join
		end
		lines.join("\n")
	end

	def edge_weight(x, y)
		l = @list[x]
		n = l.read(0) if l
		while (n)
			return n.weight if n.id == y
			n = n.next
		end
	end

	def to_s
		print_adj_list
	end

	private
		def build_lookup
			@longest_name = 0
			@lookup = []
			@edge_list.list.each do |i|
				x = i[0]
				y = i[1]
				@longest_name = x.name.length > @longest_name ? x.name.length : @longest_name
				@longest_name = y.name.length > @longest_name ? y.name.length : @longest_name
				@lookup[x.id] = x unless @lookup[x.id]
				@lookup[y.id] = y unless @lookup[y.id]
			end
			@lookup
		end

		def build_list
			@list = Array.new(@lookup.length)
			@edge_list.list.each do |i|
				x = i[0]
				y = i[1]
				@list[x.id] = LinkedList.new unless @list[x.id]
				@list[x.id].append(ListNode.new(y.name, y.id, i[2]))
				@list[y.id] = LinkedList.new unless @list[y.id]
				@list[y.id].append(ListNode.new(x.name, x.id, i[2]))
			end
			@list
		end
end


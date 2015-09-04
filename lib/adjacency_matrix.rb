class AdjacencyMatrix
	attr_accessor :edge_list
	attr_reader :matrix, :lookup

	def initialize(edge_list)
		self.edge_list = edge_list
	end

	def edge_list=(value)
		@edge_list = value
		build_lookup
		build_matrix
	end

	def print_matrix
		names = @lookup.map {|p| "#{p.name}".center(@longest_name + 3)}.join
		padding = " " * (@longest_name + 5)
		lines = [" -- Adjacency Matrix -- ", "#{padding}#{names}"]
		@matrix.each_with_index do |y, i|
			line = ["#{i}. #{@lookup[i].name}".ljust(@longest_name + 5)]
			y.each_with_index do |x, i|
				index = "#{x}".center(@longest_name + 2)
				line << "|#{index}"
			end
			line = line.join
			lines << line
			lines << '-' * line.length
		end
		lines.join("\n")
	end

	def edge_weight(x, y)
		@matrix[y][x]
	end

	def to_s
		print_matrix
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

		def build_matrix
			@matrix = Array.new(@lookup.length){Array.new(@lookup.length)}
			@edge_list.list.each do |i|
				x = i[0]
				y = i[1]
				w = i[2]
				@matrix[y.id][x.id] = w
				@matrix[x.id][y.id] = w
			end
			@matrix
		end
end
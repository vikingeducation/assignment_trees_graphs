require_relative "./edge_list.rb"

Node = Struct.new(:id, :data, :connection, :next)

class AdjacencyList

	attr_reader :adj_list

  def initialize (edge_list)
    @list = edge_list.list
    @adj_list = []
  end

  def initialize_adj_list
  	@list.each do |pair|
  		(0..1).each do |index|
  			unless @adj_list.include?(pair[index].id)
  				@adj_list << Node.new(pair[index].id, pair[index], nil)
  			end
  		end
  	end
  end

  def create_adj_list
  	initialize_adj_list
  	@list.each do |pair|
  		@adj_list.each do |index|
  			if @adj_list[index].id == pair[0].id
  				new_entry = Node.new(pair[1].id, pair[1], pair[2], nil)
  				@adj_list[index].next = new_entry
  				@adj_list[index] = new_entry
  			end
  		end
  	end
  end

  def print_adj_list

  end

end

#Test Script
e = EdgeList.new(3)
am = AdjacencyList.new(e)
#am.initialize_adj_list
am.create_adj_list
print am.adj_list.id
require './edge_list'
require './linked_list'
require 'rainbow'

e = EdgeList.new(10).list

class AdjacencyList

  def initialize(edge_list)
    @edge_list = edge_list
    @list = Array.new(max_id) { LinkedList.new }
    @names = Array.new
  end

  def build_list
    @edge_list.each do |edge|
			from, to, weight = edge
      @list[from.id].add_node(to.name, weight)
      @list[to.id].add_node(from.name, weight)
      @names[from.id] = from.name
      @names[to.id] = to.name
    end
  end

  def display_list
    @list.each_with_index do |list, index|
      next unless @names[index]
      print Rainbow(@names[index].ljust(longest_name + 1)).cyan
      print list
      puts
    end
  end

  def edge_weight(from, to)
    puts @list[from].find_node_at(to).weight
  end

  private

	def longest_name
		lengths = []
		@names.each do |name|
      next unless name
			lengths << name.length
		end
		lengths.max
	end

	def max_id
		max_num = []
		@edge_list.each do |edge|
			from, to, weight = edge # !> assigned but unused variable - weight
			max_num << from.id
			max_num << to.id
		end
		max_num.max + 1
	end
end

list = AdjacencyList.new(e)

list.build_list
list.display_list
list.edge_weight(0,2)

# >> EDGE LIST SIZE: 18
# >> Adam    Alice(1), Alok(2), Boris(4), Garrett(7)
# >> Alice   Adam(1), Alok(10), Harry(16), Joseph(17)
# >> Alok    Adam(2), Alice(10), Andur(18), Garrett(1), Harry(2)
# >> Andur   Alok(18), Boris(4), Garrett(7)
# >> Boris   Adam(4), Andur(4), Dan(10)
# >> Dan     Boris(10), Garrett(16), Harry(17), Joseph(18)
# >> Garrett Adam(7), Alok(1), Andur(7), Dan(16), Harry(1), Joseph(2)
# >> Harry   Alice(16), Alok(2), Dan(17), Garrett(1)
# >> Joseph  Alice(17), Dan(18), Garrett(2)
# >> 
# >> 0
# >> 1
# >> returning node at 2
# >> 4

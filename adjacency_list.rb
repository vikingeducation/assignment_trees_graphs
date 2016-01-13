require_relative "edge_list.rb"
require_relative "linked_list.rb"

class AdjacencyList

  def initialize(edge_list)
    @edge_list = edge_list.list
    @people_count = edge_list.people.length
    @id_list = Array.new(@people_count)
    @people = edge_list.people
  end

  def fill_list # filling the list with person, weight
    @edge_list.each do |edge|
      if @id_list[edge[0].id]
        puts "#{edge[1]} #{edge[2]}"
        @id_list[edge[0].id].add_node(edge[1], edge[2])
      else
        #append to linked_list
        @id_list[edge[0].id] = LinkedList.new
        @id_list[edge[0].id].add_node(edge[1], edge[2])
      end
    end
  end

  def print_adj_list
    (0...@people_count).each do |row|
      print "#{@people[row].name}\t"
      if @id_list[row]
        @id_list[row].each do |node|
          print "#{node.word.name}(#{node.word.weight}), "
        end
      else
        print "nil"
      end
      print "\n"
    end
  end
end

# Set up the structure
el = EdgeList.new( 10, 4 )
al = AdjacencyList.new( el )
al.fill_list
# al.print_adj_list
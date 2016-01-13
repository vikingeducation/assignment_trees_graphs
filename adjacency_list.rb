require_relative "edge_list.rb"
require_relative "linked_list.rb"

class AdjacencyList
  attr_reader :id_list

  def initialize(edge_list)
    @edge_list = edge_list.list
    @people_count = edge_list.people.length
    @id_list = Array.new(@people_count)
    @people = edge_list.people
  end

  def fill_list # filling the list with person, edge weight
    @edge_list.each do |edge|
      #forward edge direction
      if @id_list[edge[0].id]
        @id_list[edge[0].id].add_node(edge[1], edge[2])
      else
        @id_list[edge[0].id] = LinkedList.new
        @id_list[edge[0].id].add_node(edge[1], edge[2])
      end
      #reverse edge direction
      if @id_list[edge[1].id]
        @id_list[edge[1].id].add_node(edge[0], edge[2])
      else
        @id_list[edge[1].id] = LinkedList.new
        @id_list[edge[1].id].add_node(edge[0], edge[2])
      end

    end
  end

  def print_adj_list
    (0...@people_count).each do |row|
      print "#{@people[row].name}\t"
      if @id_list[row]
        @id_list[row].each do |node|
          print "#{node.word.name}(#{node.definition}) "
        end
      else
        print "X"
      end
      print "\n"
    end
  end

  def edge_weight(id_1, id_2)
    @id_list[id_1].find_word(@people[id_2]).definition
  end
end

# Set up the structure
el = EdgeList.new( 4 )
el.print_list

al = AdjacencyList.new( el )
al.fill_list
al.print_adj_list

puts al.edge_weight(1,2)

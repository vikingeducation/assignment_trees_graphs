require_relative 'edge_list'
require_relative 'linked_list'

class AdjacencyList

  def initialize(edge_list)
    @edge_list = edge_list
    @vertices_list = make_vertices_list
    @adj_list = make_adj_list
  end

  def make_vertices_list
  	persons = []
    @edge_list.each do |connection|
      persons[connection[0].id] = connection[0].name
      persons[connection[1].id] = connection[1].name
    end
    persons
  end

  def make_adj_list
    buckets = Array.new(20)
    @edge_list.each do |connection|
      person_from, person_to, weight = *connection 
      
      buckets[person_from.id] ||= LinkedList.new
      buckets[person_from.id].append_node(person_from.id, person_to.id, weight)
    end
    buckets
  end

  def print_adj_list
  	@adj_list.each_with_index do |linked_list, person_from|
      print "#{@vertices_list[person_from]}: "
      if linked_list.nil?
      	print "None"
      else
      	current_node = linked_list.head
      	until current_node.nil?
          print "#{current_node.person_to}(#{current_node.weight})"
          unless current_node.next.nil?
          	print ", "
          end
          current_node = current_node.next
        end
      end
      puts
  	end
  end

  def edge_weight(from, nth_connection)

    puts @adj_list[from].find_node(nth_connection).weight

  end

end

al = AdjacencyList.new(EDGE_LIST)
al.edge_weight(1,2) # => 11
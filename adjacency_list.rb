require_relative 'edge_list'
require_relative 'linked_list'
require 'pry'

class AdjacencyList
  attr_reader :adjacency_list

  def initialize(edge_list, num_people = 5)
    @edge_list = edge_list
    @adjacency_list = get_adjacency_list(@edge_list, num_people)
  end

  def print_adj_list
    @adjacency_list.each_with_index do |person_linked_list, index|
      print  @edge_list.people[index].name.ljust(9)
      print_linked_list(person_linked_list)
      print "\n"
    end
  end

  # O(n) where n is the size of the sub-list just for that person's linked list
  def edge_weight(from, to)
    return nil if @adjacency_list[from].nil?

    @adjacency_list[from].get_weight(to)
  end

  private

  def print_linked_list(list)
    return if list.nil?
    current_node = list.head.next

    loop do
      break if current_node.nil?
      print "#{@edge_list.people[current_node.person].name}(#{current_node.weight})".ljust(10)
      current_node = current_node.next
    end
  end

  def get_adjacency_list(edge_list, num_people)
    alist = Array.new(num_people)

    edge_list.list.each do |edge|
      current_node = edge[0].id
      weight = edge[2]
      next_node = edge[1].id

      if alist[current_node].nil?
        linked_list = LinkedList.new
        linked_list.add_node_to_end(current_node, nil)
        alist[current_node] = linked_list
      end

      alist[current_node].add_node_to_end(next_node, weight)
    end

    alist
  end
end

e = EdgeList.new
e.print_list
a = AdjacencyList.new(e)
a.print_adj_list
puts a.edge_weight(0,2)
puts a.edge_weight(1,4)
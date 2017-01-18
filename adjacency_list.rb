require_relative 'edge_list'
require_relative 'linkedlist'

class AdjacencyList
  attr_reader :list, :first
  def initialize(list)
    @list = []
    build_linked_list(list)
  end

  def build_linked_list(list)
    list.each do |row|
      from = row[0]
      to = row[1]
      weight = row[2]

      @list[from.id] = LinkedList.new(Node.new(from.id, from.name)) unless @list[from.id]
      @list[from.id].add_node(to.id, to.name, weight) if @list[from.id]
      @list[to.id] = LinkedList.new(Node.new(to.id, to.name)) unless @list[to.id]
      @list[to.id].add_node(from.id, from.name, weight) if @list[to.id]
    end
  end

  def print_adj_list
    @list.each do |ll|
      current = ll.first
      print "#{current.id}: #{current.name}"
      current = current.next
      until current.nil?
        print " -> #{current.name} (#{current.weight})"
        current = current.next
      end
      puts
    end
  end

  def edge_weight(from, to)
    current = @list[from].first
    until current.nil?
      return current.weight if to == current.id
      current = current.next
    end
    "No edge found"
  end

end

al = AdjacencyList.new(EDGE_LIST)
al.print_adj_list
p al.edge_weight(1, 10)

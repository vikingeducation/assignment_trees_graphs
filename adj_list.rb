require_relative 'edge_list'
require_relative 'linked_list'
require 'pry'

class AdjacencyList

  attr_reader :adj_list

  def initialize(array)
    @adj_list = []
    @nodes = []
    array_size = array_sizer(array)
    build_list
    populate(array)
  end

  def build_list
    @nodes.each do |node|
      @adj_list << LinkedList.new(node)
    end
  end

  def array_sizer(array)
    array.each do |item|
        @nodes << [item[0][0], item[0][1]]
        @nodes << [item[1][0], item[1][1]]
    end
    @nodes.uniq!.sort!
    @nodes.size
  end

  def populate(array)
    array.each do |row|
      @adj_list[row[0][0]].add_node_to_end(row[1], row[2])
    end
  end

  def print_adj_list
    @adj_list.each do |list|
      print "#{list.head.data[1]}:".ljust(15)
      current_node = list.head
      until current_node.next == nil
        print "#{current_node.next.data[1]}(#{current_node.next.weight})".ljust(14)
        current_node = current_node.next
      end
      puts
    end
  end

  def edge_weight(x,y)
    if @adj_list[x].find_weight(y)
      return @adj_list[x].find_weight(y)
    else
      return "No result found"
    end

  end

end

a = AdjacencyList.new(EDGE_LIST)
puts a.edge_weight(12,18)

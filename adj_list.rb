require_relative 'edge_list'
require_relative 'linkedlist_hashtable'
require 'pry'

class AdjacencyList

  def initialize(array)
    @adj_list = []
    @nodes = []
    array_size = array_sizer(array)

  end

  def build_list
    @nodes.each do |node|
      @adj_list << LinkedList.new(node)
    end
  end

  def array_sizer(array)
    array.each do |item|
        @nodes += item[0]
        @nodes += item[1]
    end
    @nodes.uniq!.sort!
    @nodes.size
  end

  def populate(array)
    array.each do |row|
      @adj_list[row[0].id].insert([row[1], row[2]], :tail)
    end
  end

end

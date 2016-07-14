#adjacency_list.rb
require_relative 'edge_list'
require_relative 'linked_list'
require "pry"

class AdjacencyList
  attr_reader :arr

  def initialize(list)
    @arr = Array.new(20) { LinkedList.new }
    @list = list
  end

  def build
    @list.each do |row|
      # row[0] is the 1st, row[1] is the 2nd, row[2] is weight
      @arr[row[0].id].add_node([row[1], row[2]])
      # binding.pry

    end
  end

  def render
    #arr [linkedlists]
    @arr.each do |list|
      # current list of nodes in array form [[data], ]
      current_list = list.return_all_nodes
      current_list.each do |node|
        # binding.pry

        print "#{node.data[0].name}(#{node.data[1]}), "
      # look at list of nodes and print.
      end
      puts
    end
  end
end

a = AdjacencyList.new(EDGE_LIST)
a.build
a.render

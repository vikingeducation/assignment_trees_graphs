#adjacency_list.rb
require_relative 'edge_list'
require_relative 'linked_list'

class AdjacencyList
  attr_reader: :arr

  def initiliaze(list)
    @arr = Array.new(20) {LinkedList.new(nil)}
    @list = list
  end

  def build
    # [0] -> 



  end


end
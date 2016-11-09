
require_relative 'edge_list'
require_relative 'linked_list'

class AdjacencyList

  def initialize(edge_list = EDGE_LIST)
    @edge_list = edge_list
    @list = []
  end

  def populate_list
    # iterate through edge list
    # create list unless list
      # add node w/ name & edge distance
    # else
      # add node w/ vertex to existing list
  end

  def vertices
    vertices = @edge_list.flatten.uniq
    vertices.select! {|element| element.is_a?(Person)}
  end

  def sorted_vertices
    vertices.sort_by {|element| element.id}
  end
end

list = AdjacencyList.new

p list.vertices

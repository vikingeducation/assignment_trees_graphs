
require_relative 'edge_list'
require_relative 'linked_list'

class AdjacencyList

  def initialize(edge_list = EDGE_LIST)
    @edge_list = edge_list
    @list = []
  end

  def populate_list
    @edge_list.each do |edge|
      list_index = edge[0].id
      data = [edge[1].name, edge[2]]
      if list = @list[list_index] 
         list.add_node(data)
      else
        linked_list = LinkedList.new
        @list[list_index] = linked_list
        linked_list.add_node(data)
      end
    end
  end

  def render
    @list.each_with_index do |row, index|
      output = row ? row.view : " "
      puts "#{ index }: #{ output }"
    end
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
list.populate_list
list.render

require_relative 'edge_list'

class AdjacencyMatrix

  def initialize(edge_list)
    @matrix=Array.new(20){Array.new(20)}
    edge_list.each do |edge|
      origin_person=edge[0]
      destination_person=edge[1]
      weight=edge[2]
      @matrix[origin_person.id][destination_person.id]=weight
    end
  end

  def print_matrix
  end

  def get_names(edge_list)
    id_to_names={}
    edge_list.each do |edge|
      id_to_names[edge[0].id]=edge[0].name
      id_to_names[edge[1].id]=edge[1].name
    end
    id_to_names
  end

end

am=AdjacencyMatrix.new(EDGE_LIST)

p am.get_names(EDGE_LIST).keys.sort
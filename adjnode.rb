class Node
  attr_accessor :id, :name, :parent, :children, :weight

  def initialize( id, name, weight, edge )

    @id = id
    @name = name
    @weight = weight
    @edge = edge

  end


end
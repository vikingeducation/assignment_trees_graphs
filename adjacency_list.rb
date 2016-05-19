require './linked_list.rb'

class AdjacencyList

  attr_accessor :buckets

  def initialize(edges)
    @buckets = []
    build_list(edges)
  end

  def build_list(edges)
    edges.each do |edge|
      person1, person2, weight = edge[0], edge[1], edge[2]
      insert(person1.id, person1.name, person1.id, weight)
      insert(person1.id, person2.name, person2.id, weight)
      insert(person2.id, person2.name, person2.id, weight)
      insert(person2.id, person1.name, person1.id, weight)
    end
  end

  def insert(index, name, id, weight)
    if @buckets[index].nil?
      @buckets[index] = LinkedList.new(Node.new(name, id, nil, nil))
    elsif index != id
      @buckets[index].add_node(name, id, weight)
    end
  end

end

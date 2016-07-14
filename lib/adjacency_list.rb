require_relative '../edge_list'

Node = Struct.new(:name, :id, :next)

class AdjacencyList

  def initialize(edge_list)
    @names_table = get_names_table
    @hash_list = build_array
    @edge_list = edge_list
  end

  def get_names_table
    new_hash = {}
    edge_list.each do |edge|
      next if new_hash.keys.include?(edge[0].id)
      new_hash[edge[0].id] = edge[0]
    end
    new_hash
  end

  def build_array
    array = []
    @names_table.each do |keys, value| 
      array[keys] = Node.new(value.name, value.id)
    end
    array
  end

  def build_the_list
    @edge_list.each do |edge|

    end
  end

  def add_node(edge)
      
      new_word = Node.new(edge[1].name, edge[1].id)
      @last.next = new_word
      @last = new_word
  end

end
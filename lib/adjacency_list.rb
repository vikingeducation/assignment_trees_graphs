require_relative '../edge_list'

Node = Struct.new(:name, :id, :weight, :next)

class AdjacencyList
  attr_reader :adj_list

  def initialize(edge_list)
    @edge_list = edge_list
    @names_table = get_names_table
    @adj_list = build_array
    #build_the_list
  end

  def get_names_table
    new_hash = {}
    @edge_list.each do |edge|
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
      new_node = Node.new(edge[1].name, edge[1].id, edge[2])
      top = @adj_list[edge[0].id]
      loop do
        if top.next == nil
          top.next = new_node
          break
        else
          top = top.next
        end
      end
    end
  end

end

adj = AdjacencyList.new(EDGE_LIST)
adj.build_the_list
p adj.adj_list[1]

require_relative 'edge_list'
require_relative 'linked_list'

class AdjacencyList
  def initialize(edge_list)
    @edges = edge_list
    @adj_list = Array.new(max_id) {LinkedLists.new}
    @names = Array.new
  end

  def max_id
    max_num = []
    @edges.each do |edge|
      from, to, weight = edge
      max_num << from.id
      max_num << to.id
    end
    return (max_num.max) + 1
  end

  def build_adj_list
    @edges.each do |edge|
      from, to, weight = edge
      @adj_list[from.id].add_node(to.name, weight)
      @adj_list[to.id].add_node(from.name, weight)
      @names[from.id] = from.name
      @names[to.id] = to.name
    end
  end

  def max_name_len
    lens = []
    @names.each do |name|
      lens << name.length
    end
    return lens.max
  end

  def print_adj_list
    @adj_list.each_with_index do |list, index|
      next unless @names[index]
      print @names[index].ljust(max_name_len + 1)
      print list
      puts
    end
  end

  def edge_weight(from, to)
    puts @adj_list[from].find_node(to)
  end

end
al = AdjacencyList.new(EDGE_LIST)
al.build_adj_list
al.print_adj_list
al.edge_weight(0, 2)

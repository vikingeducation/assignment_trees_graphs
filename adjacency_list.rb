require_relative './linked_list'
require_relative './edge_list'

class AdjacencyList
  def initialize(edge_list = nil)
    @lookup = nil
    @list = nil

    unless edge_list.nil?
      @lookup = build_lookup(edge_list)
      @list = build_list(edge_list)
    end
  end

  def print_adj_list; end

  def edge_weight(from, to); end

  private

  def build_lookup(edge_list)
    from_hash = {}
    to_hash = {}

    edge_list.each do |edge|
      from = edge[0]
      to = edge[1]

      from_hash[from.id] = from.name
      to_hash[to.id] = to.name
    end

    from_hash.merge(to_hash)
  end

  def build_list(edge_list)
    edge_list.each do |edge|
      from = edge[0].id
      to = edge[1].id
      weight = edge[2]

      # if @list[from].nil?
      #   @list[from] = LinkedList.new
      #   @list[from].add_to_end()
    end
  end
end

if __FILE__ == $0
  al = AdjacencyList.new(EDGE_LIST)
  p al
end

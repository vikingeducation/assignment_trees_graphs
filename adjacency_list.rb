require_relative './linked_list'
require_relative './edge_list'

class AdjacencyList
  attr_reader :lookup,
              :contents

  def initialize(edge_list = nil)
    @lookup = nil
    @contents = []

    unless edge_list.nil?
      @lookup = build_lookup(edge_list)
      @contents = build_adj_list(edge_list)
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

  def build_adj_list(edge_list)
    contents = []

    edge_list.each do |edge|
      from = edge[0].id
      to = edge[1].id
      weight = edge[2]

      contents[from] = LinkedList.new if contents[from].nil?

      contents[from].insert_at_end(to, weight)
    end

    contents
  end
end

if __FILE__ == $0
  al = AdjacencyList.new(EDGE_LIST)
end

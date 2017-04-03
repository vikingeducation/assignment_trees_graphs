require_relative './linked_list'
require_relative './edge_list'

class AdjacencyList
  attr_reader :lookup,
              :buckets

  def initialize(edge_list = nil)
    @lookup = nil
    @buckets = []

    unless edge_list.nil?
      @lookup = build_lookup(edge_list)
      @buckets = build_adj_list(edge_list)
    end
  end

  def print_adj_list
    self.buckets.length.times do |index|
      unless self.buckets[index].nil?
        bucket_contents = ""

        # add source vertex name
        bucket_contents << "#{self.lookup[index]}\t\t"

        # now iterate through the linked list and read the destination vertices
        bucket_contents << read_adj_list_bucket(self.buckets[index].head)

        puts bucket_contents
      end
    end
  end

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
    buckets = []

    edge_list.each do |edge|
      from = edge[0].id
      to = edge[1].id
      weight = edge[2]

      buckets[from] = LinkedList.new if buckets[from].nil?

      buckets[from].insert_at_end(to, weight)
    end

    buckets
  end

  # NOTE: I know, I know, DRY.. it's easier to just write this method
  # to read each bucket, rather than modify #LinkedList#read
  def read_adj_list_bucket(node)
    output = ""
    while (node)
      output << "#{self.lookup[node.to]}(#{node.weight}), "
      node = node.next_node
    end

    # remove trailing space and comma
    output[0..-3]
  end
end

if __FILE__ == $0
  al = AdjacencyList.new(EDGE_LIST)
  al.print_adj_list
end

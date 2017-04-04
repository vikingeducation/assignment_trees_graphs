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

  # O(n) - need to traverse the whole linked list in the worst case
  def edge_weight(from, to)
    unless self.buckets[from].nil?
      node = self.buckets[from].head
      while(node)
        return node.weight if node.to == to
        node = node.next_node
      end
    end

    nil
  end

  def show_stats
    puts "\nTotal number of nodes: #{count_nodes}"

    most_connected_vertices

    strongest_connected_vertices
  end

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

  # O(n) - we need to count each source/destination vertice
  def count_nodes
    nodes = 0
    self.buckets.each { |bucket| nodes += bucket.length unless bucket.nil? }

    nodes
  end

  # O(n) - we need to iterate through each linked list to determine the degrees
  # for each source vertex
  def most_connected_vertices
    degrees = {}
    self.buckets.each_with_index { |bucket, i| degrees[self.lookup[i]] = bucket.length unless bucket.nil? }

    puts "\nThe top 3 most connected vertices are:"

    3.times do
      max_degree = degrees.values.max

      while degrees.key(max_degree)
        puts "#{degrees.key(max_degree)} - #{max_degree}"
        degrees.delete(degrees.key(max_degree))
      end
    end
  end

  # O(n) - we need to iterate through each linked list to determine the total
  # edge weight for each source vertex
  def strongest_connected_vertices
    edge_weights = {}
    self.buckets.each_with_index { |bucket, i| edge_weights[self.lookup[i]] = edge_weight(bucket) unless bucket.nil? }

    puts "\nThe top 3 strongest connected vertices are: "

    3.times do
      max_edge_weight = edge_weights.values.max

      while edge_weights.key(max_edge_weight)
        puts "#{edge_weights.key(max_edge_weight)} - #{max_edge_weight}"
        edge_weights.delete(edge_weights.key(max_edge_weight))
      end
    end
  end

  # O(n)
  def edge_weight(vertex)
    total_weight = 0

    crawler = vertex.head
    while(crawler)
      total_weight += crawler.weight
      crawler = crawler.next_node
    end

    total_weight
  end
end

if __FILE__ == $0
  adj_list = AdjacencyList.new(EDGE_LIST)
  adj_list.print_adj_list
  adj_list.show_stats
end

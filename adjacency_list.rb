require_relative "edge_list.rb"
require_relative 'linked_list.rb'
require 'pry-byebug'

PEOPLE_LIST = {
  0 => 'Bob',
  1 => 'Harry',
  2 => 'Sally',
  3 => 'Sam',
  4 => 'Michael',
  5 => 'Michelle',
  6 => 'Alok',
  7 => 'Dan',
  8 => 'Nick',
  9 => 'Olga',
  10 => 'Alice',
  11 => 'Donald',
  12 => 'Garrett',
  13 => 'Xin',
  14 => 'Mike',
  15 => 'Adam',
  16 => 'Peter',
  17 => 'Andur',
  18 => 'Tom',
  19 => 'Boris'
}

class AdjacencyList
  def initialize lists
    @adj_buckets = []
    set_list lists
  end

  def set_list lists
    lists.each do |connection|
      from_index = connection[0].id
      to_index = connection[1].id
      weight = connection[2]
      bucket = @adj_buckets[from_index]
      if bucket.nil?
        bucket = LinkedList.new
        bucket.add_first_node([to_index, weight])
      else
        bucket.add_node([to_index, weight])
      end
      @adj_buckets[from_index] = bucket
    end
  end

  def print_adj_list
    @adj_buckets.each_with_index do |bucket, index|
      next if bucket.nil?
      print PEOPLE_LIST[index].ljust(10)
      bucket.print_list
      puts ''
    end
  end

  def edge_weight(from, to)
    @adj_buckets[from].search_node(to)
  end

end

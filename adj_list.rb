require_relative './edge_list'
require_relative './linked_list'

NAMES = {
  0 => 'Bob',
  1 => 'Harry',
  2 =>  'Sally',
  3 =>  'Sam',
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
  attr_reader :origins

  def initialize(list)
    @list = list
    @origins = Array.new(20)
  end

  def convert_list
    @list.each do |connection|
      insert_connection(connection)
    end
  end

  def insert_connection(connection)
    @origins[connection[0].id ] ||= LinkedList.new
    @origins[connection[0].id].add_node(connection[1].id, connection[2])
  end

  def print_adj_list
    @origins.each_with_index do |list, index|
      print "#{ NAMES[ index ] }: "
      unless list.nil?
        current_node = list.first
        until current_node.nil?
          print "#{NAMES[current_node.id]}(#{current_node.weight}) "
          current_node = current_node.next_node
        end
      end
      puts
    end
  end

end

a = AdjacencyList.new(EDGE_LIST)
a.convert_list
a.print_adj_list
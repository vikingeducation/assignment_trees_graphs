require_relative './edge_list'
require_relative './linked_list'

NAMES = {
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
  19 => 'Boris',
}

class AdjacencyList

  def initialize(list)
    @list = list
    @origins = Array.new(19)
  end

  def insert_connection(connection)
    @origins[connection[0].id - 1] ||= LinkedList.new
    @origins[connection[0].id - 1].add_node(connection[1].id - 1, connection[2])
  end



end

a = AdjacencyList.new(EDGE_LIST)
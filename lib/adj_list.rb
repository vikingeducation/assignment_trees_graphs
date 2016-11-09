require_relative '../edge_list.rb'
require_relative '../linked_list.rb'


class AdjList

  def initialize data
    build(data)
  end

  def build(data)
    @adj_list = Array.new(count_people(data))
    @look_up_table = Array.new(count_people(data))

    data.each do |edge|
      @look_up_table[edge[0].id] ||= edge[0].name
      @look_up_table[edge[1].id] ||= edge[1].name
      @adj_list[edge[0].id] ||= LinkedList.new(Node.new(edge[0].id))
      @adj_list[edge[0].id].add(Node.new(edge[1].id, edge[2])) 
    end
  end

  def print_list
    @adj_list.each do |edges|
        (0..edges.number_of_nodes).each do |index|
          print edges.read(index)
        end
    end
  end

  def count_people(data)
    max = 0

    data.each do |edge|
      if edge[0].id > max
        max = edge[0].id
      end

      if edge[1].id > max
        max = edge[1].id
      end
    end

    max + 1 # IDs start at index 0
  end

end


AdjList.new(EDGE_LIST).print_list
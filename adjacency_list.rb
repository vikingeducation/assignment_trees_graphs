require_relative 'edge_list'
require_relative 'linked_list'


Node = Struct.new(:person, :weight, :next)

class AdjacencyList

  def initialize(edge_list)
    @adj_list=Array.new(20) { LinkedList.new }
    @id_to_names = get_names(edge_list)

    edge_list.each do |edge|
      new_node = Node.new(edge[1], edge[2], nil)
      index = edge[0].id
      @adj_list[index].append(new_node)
    end
  end

  def get_names(edge_list)
    id_to_names={}
    edge_list.each do |edge|
      id_to_names[edge[0].id]=edge[0].name
      id_to_names[edge[1].id]=edge[1].name
    end
    id_to_names
  end

  def print_adj_list
    str = ""
    @adj_list.each_with_index do |ll, index|
      str << "#{@id_to_names[index].ljust(length_of_longest_name + 1)}"
      current_node = ll.head
      while current_node != nil
        str << "#{current_node.person.name}(#{current_node.weight})  "
        current_node = current_node.next
      end
      str << "\n"
    end
    puts str
  end

  def length_of_longest_name
    @id_to_names.values.reduce(0) do |memo, name|
      if name.length > memo
        name.length
      else
        memo
      end
    end
  end


  def linked_list_at_index(index, position = 0)
    @adj_list[index].read(position)
  end

end

al = AdjacencyList.new(EDGE_LIST)
al.print_adj_list

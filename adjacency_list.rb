require_relative "edge_list"

Node = Struct.new(:name, :weight, :next)

class LinkedList
  attr_accessor :head, :last

  def initialize(first_node = nil)
    @head = first_node
    @last = first_node
  end

  def add_first_node(name, weight = nil)
    @head = Node.new(name, weight, nil)
    @last = @head
  end

  def add_node(name, weight = nil)
    if @head == nil
      add_first_node(name, weight)
    else
      new_node = Node.new(name, weight, nil)
      @last.next = new_node
      @last = new_node
    end
  end

  def find_node(index)
    step = 0
    current_node = @head
    while step < index
      current_node = current_node.next
      step += 1
    end
    current_node
  end
end



class AdjacencyList

  def initialize(edge_list)
    @edge_list = edge_list
    @buckets = populate_adjacent_list
  end

  def ids_array
    ids_arr = []
    @edge_list.each do |persons|
      ids_arr << persons[0].id unless ids_arr.include? persons[0].id
      ids_arr << persons[1].id unless ids_arr.include? persons[1].id
    end
    ids_arr
  end

  def array_of_empty_buckets
    Array.new(ids_array.length)
  end

  def names_array
    names_arr = array_of_empty_buckets
    @edge_list.each do |array|
      names_arr[array[0].id] = array[0].name unless names_arr.include? array[0].name
      names_arr[array[1].id] = array[1].name unless names_arr.include? array[1].name
    end
    names_arr
  end

  def populate_adjacent_list
    unique_names = names_array
    buckets = array_of_empty_buckets
    buckets.length.times do |idx|
      buckets[idx] = LinkedList.new if buckets[idx] == nil
      current_node = buckets[idx]
      current_node.add_node(unique_names[idx], nil)
      @edge_list.each do |vertex_arr|
        if unique_names[idx] == vertex_arr[0].name
          current_node.add_node(vertex_arr[1].name, vertex_arr[2])
        end
      end
    end
    buckets
  end

  def edge_weight(idx_1, idx_2)
    name_2 = names_array[idx_2]
    current_node = @buckets[idx_1].head
    while name_2 != current_node.name
      current_node = current_node.next
    end
    current_node.weight
  end


  def print_adj_list
    @buckets.each do |linked_list|
      current_node = linked_list.head
      print "#{current_node.name}".ljust(10)
      while !current_node.next.nil?
        current_node = current_node.next
        print "#{current_node.name}(#{current_node.weight})".ljust(13)
      end
      puts
    end
  end

end

al = AdjacencyList.new( EDGE_LIST )
al.print_adj_list
print "#{al.edge_weight(13,18)}"

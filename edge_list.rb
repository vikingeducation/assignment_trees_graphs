
# Person struct
Person = Struct.new(:id, :name)

# An edge list of connections between people in the format
# [ORIGIN_PERSON, DESTINATION_PERSON, WEIGHT]

EDGE_LIST = [
  [Person.new(1 ,'Harry'), Person.new(10 ,'Alice'), 2],
  [Person.new(1 ,'Harry'), Person.new(0 ,'Bob'), 9],
  [Person.new(1 ,'Harry'), Person.new(4 ,'Michael'), 11],
  [Person.new(1 ,'Harry'), Person.new(16 ,'Peter'), 12],
  [Person.new(2 ,'Sally'), Person.new(7 ,'Dan'), 16],
  [Person.new(2 ,'Sally'), Person.new(14 ,'Mike'), 1],
  [Person.new(2 ,'Sally'), Person.new(10 ,'Alice'), 7],
  [Person.new(3 ,'Sam'), Person.new(19 ,'Boris'), 16],
  [Person.new(4 ,'Michael'), Person.new(7 ,'Dan'), 19],
  [Person.new(4 ,'Michael'), Person.new(2 ,'Sally'), 8],
  [Person.new(4 ,'Michael'), Person.new(17 ,'Andur'), 11],
  [Person.new(4 ,'Michael'), Person.new(14 ,'Mike'), 11],
  [Person.new(5 ,'Michelle'), Person.new(3 ,'Sam'), 9],
  [Person.new(5 ,'Michelle'), Person.new(10 ,'Alice'), 12],
  [Person.new(5 ,'Michelle'), Person.new(6 ,'Alok'), 12],
  [Person.new(7 ,'Dan'), Person.new(19 ,'Boris'), 13],
  [Person.new(7 ,'Dan'), Person.new(10 ,'Alice'), 11],
  [Person.new(7 ,'Dan'), Person.new(5 ,'Michelle'), 1],
  [Person.new(8 ,'Nick'), Person.new(15 ,'Adam'), 1],
  [Person.new(8 ,'Nick'), Person.new(16 ,'Peter'), 20],
  [Person.new(8 ,'Nick'), Person.new(7 ,'Dan'), 9],
  [Person.new(8 ,'Nick'), Person.new(0 ,'Bob'), 9],
  [Person.new(9 ,'Olga'), Person.new(6 ,'Alok'), 11],
  [Person.new(9 ,'Olga'), Person.new(14 ,'Mike'), 20],
  [Person.new(9 ,'Olga'), Person.new(19 ,'Boris'), 12],
  [Person.new(10 ,'Alice'), Person.new(3 ,'Sam'), 19],
  [Person.new(11 ,'Donald'), Person.new(7 ,'Dan'), 19],
  [Person.new(12 ,'Garrett'), Person.new(10 ,'Alice'), 15],
  [Person.new(12 ,'Garrett'), Person.new(16 ,'Peter'), 7],
  [Person.new(12 ,'Garrett'), Person.new(17 ,'Andur'), 16],
  [Person.new(12 ,'Garrett'), Person.new(18 ,'Tom'), 4],
  [Person.new(13 ,'Xin'), Person.new(8 ,'Nick'), 5],
  [Person.new(13 ,'Xin'), Person.new(5 ,'Michelle'), 3],
  [Person.new(13 ,'Xin'), Person.new(18 ,'Tom'), 12],
  [Person.new(13 ,'Xin'), Person.new(15 ,'Adam'), 17],
  [Person.new(14 ,'Mike'), Person.new(12 ,'Garrett'), 10],
  [Person.new(15 ,'Adam'), Person.new(0 ,'Bob'), 18],
  [Person.new(15 ,'Adam'), Person.new(17 ,'Andur'), 8],
  [Person.new(16 ,'Peter'), Person.new(4 ,'Michael'), 12],
  [Person.new(16 ,'Peter'), Person.new(11 ,'Donald'), 10],
  [Person.new(16 ,'Peter'), Person.new(2 ,'Sally'), 1],
  [Person.new(17 ,'Andur'), Person.new(14 ,'Mike'), 9],
  [Person.new(17 ,'Andur'), Person.new(5 ,'Michelle'), 17],
  [Person.new(18 ,'Tom'), Person.new(14 ,'Mike'), 9],
  [Person.new(18 ,'Tom'), Person.new(16 ,'Peter'), 14],
  [Person.new(19 ,'Boris'), Person.new(2 ,'Sally'), 5],
  [Person.new(19 ,'Boris'), Person.new(18 ,'Tom'), 3],
  [Person.new(19 ,'Boris'), Person.new(12 ,'Garrett'), 5],
  [Person.new(19 ,'Boris'), Person.new(13 ,'Xin'), 7]
]


# Helper function to view the edge list
def print_edge_list
  lines = [" -- Edge List -- "]
  EDGE_LIST.each do |e|
    lines << "#{e[0].name}<-#{e[2]}->#{e[1].name}"
  end
  puts lines.join("\n")
end



if __FILE__ == $0
  print_edge_list
end

class AdjacencyMatrix

  def initialize(edge_list)
    @edge_list = edge_list
    @matrix = populate_matrix
  end

  def populate_matrix
    matrix = Array.new(names_array.length){Array.new(names_array.length)}
    @edge_list.each do |array|
       matrix[array[0].id][array[1].id] = array[2]
    end
    matrix
  end

  def ids_array
    ids_arr = []
    @edge_list.each do |array|
      ids_array << array[0].id if ids_arr.include? array[0].id
      ids_array << array[1].id if ids_arr.include? array[1].id
    end
    ids_arr
  end

  def names_array
    names_arr = Array.new(ids_array.length)
    @edge_list.each do |array|
      names_arr[array[0].id] = array[0].name unless names_arr.include? array[0].name
      names_arr[array[1].id] = array[1].name unless names_arr.include? array[1].name
    end
    names_arr
  end

  def edge_weight(id_1, id_2)
    @matrix[id_1][id_2]
  end

  def print_matrix
    print " ".center(7)
    names_array.each { |array| print "#{array}".center(7) }
    print "\n"
    (@matrix.size).times do |array_no|
      print "#{names_array[array_no]}".center(7)
      @matrix[array_no].each {|idx| idx == nil ? (print "X".center(7)) : (print "#{idx}".center(7))}
      print "\n"
    end
  end


end

# am = AdjacencyMatrix.new( EDGE_LIST )
# am.print_matrix
# puts "#to check the weights with edge_weight(4, 17) function we get this score: {am.edge_weight(4, 17)}"

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
      puts "Taking step no #{step}"
    end
    puts "The node under index #{index} is #{current_node}"
    current_node
  end
end

class AdjacencyList

  def initialize(edge_list)
    @edge_list = edge_list
    @buckets = populate_adjecent_list
  end

  def array_with_empty_linked_lists
    array_with_names = names_array
    new_array = Array.new(array_with_names.length)
    new_array.length.times do |idx|
      new_array[idx] = LinkedList.new
    end
    new_array
  end

  def names_array
    names_arr = Array.new(ids_array.length)
    @edge_list.each do |array|
      names_arr[array[0].id] = array[0].name unless names_arr.include? array[0].name
      names_arr[array[1].id] = array[1].name unless names_arr.include? array[1].name
    end
    names_arr
  end

  def ids_array
    ids_arr = []
    @edge_list.each do |array|
      ids_array << array[0].id if ids_arr.include? array[0].id
      ids_array << array[1].id if ids_arr.include? array[1].id
    end
    ids_arr
  end

  def populate_adjecent_list
    unique_names = names_array
    buckets = array_with_empty_linked_lists
    buckets.length.times do |idx|
      current_node = buckets[idx]
      @edge_list.each do |vertex_arr|
        if buckets[idx].head == nil
          current_node.add_node(unique_names[idx], nil)
        elsif unique_names[idx] == vertex_arr[0].name
          current_node.add_node(vertex_arr[1].name, vertex_arr[2])
        end
      end
    end
    buckets
  end

  def edge_weight(idx_1, idx_2)
    name_2 = names_array[idx_2]
    current_node = @buckets[idx_1].head
    step = 0
    while current_node.name != name_2
      step += 1
      current_node = current_node.next
    end
    print "The Weight is #{current_node.weight}"
  end


  def print_adj_list
    @buckets.each do |linked_list|
      counter = 0
      current_node = linked_list.head
      print "#{current_node.name}".ljust(10)
      while !current_node.next.nil?
        current_node = current_node.next
        print "#{current_node.name}(#{current_node.weight})".ljust(13)
        counter += 1
      end
      puts
    end
  end

end

al = AdjacencyList.new( EDGE_LIST )
puts "#{al.inspect}"
al.print_adj_list
al.edge_weight(13,18)


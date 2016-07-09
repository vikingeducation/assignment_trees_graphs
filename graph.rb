require 'pry'
require_relative "edge_list.rb"

class AdjacencyMatrix
  attr_reader :am
  def initialize(el)
    @am = []
    @id_name = []
    max_id(el).times { @am << Array.new(max_id(el)) { |_i| nil } }
    @am = adjacency_matrix(el)
  end

  def max_id(edge_list)
    unique_ids = []
    edge_list.each do |edge|
      unique_ids << edge[0].id
      unique_ids << edge[1].id
      @id_name[edge[0].id] = edge[0].name
      @id_name[edge[1].id] = edge[1].name
    end
    unique_ids.max + 1
  end

  def adjacency_matrix(edge_list)
    edge_list.each do |edge|
      @am[edge[0].id][edge[1].id] = [ edge[0].name, edge[1].name, edge[2]]
      @am[edge[1].id][edge[0].id] = [ edge[0].name, edge[1].name, edge[2]]
    end
    @am
  end

  def print_matrix
    @id_name.each { |name| print "\t#{name}"}
    puts
    puts "-----"*18
    am.each_with_index do |i, index|
      print @id_name[index]
      i.each do |j|
        j.nil? ? print("\tx") : print("\t#{j[2]}")
      end
      puts
    end
  end

  #Big O(1)
  def edge_weight(id1, id2)
    @am[id1][id2][2]
  end
end

Node = Struct.new(:Person_src, :Person_dst, :weight, :next)
class AdjacencyList
  attr_accessor :al
  def initialize(el)
    @al = Array.new(max_id(el))
    el.each do |edge|
      insert(edge)
    end
  end

  def max_id(edge_list)
    unique_ids = []
    edge_list.each { |edge| unique_ids << edge[0].id ; unique_ids << edge[1].id }
    unique_ids.max + 1
  end

  def insert(edge)
    index1 = edge[0][0]
    node1 = Node.new(edge[0], edge[1], edge[2], nil)
    insert_in_index(index1, node1)
    index2 = edge[1][0]
    node2 = Node.new(edge[1], edge[0], edge[2], nil)
    insert_in_index(index2, node2)
  end

  def insert_in_index(index, node)
    if @al[index] == nil
       @al[index] = node
    else
      #iterate to end of list and insert
      temp_node = @al[index]
      loop do
        break if temp_node.next == nil
        temp_node = temp_node.next
      end
      temp_node.next = node
    end
  end

  def print_adj_list
    al.each do |item|
      next if item.nil?
      print "#{item.Person_src.name}\t" if !item.nil?
      node = item
      while node
        print " #{node.Person_dst.name}(#{node.weight})"
        node = node.next
      end
      puts
    end
  end

  #Big O(n)
  def edge_weight(id1, id2)
    node = al[id1]
    while node
      return node.weight if node.Person_dst.id == id2
      node = node.next
    end
    nil
  end

end
el = EdgeList.new(10,4).list
# p el
am = AdjacencyMatrix.new(el)
# p am
am.print_matrix
p am.edge_weight(1, 9)
al = AdjacencyList.new(el)
al.print_adj_list
p al.edge_weight(1, 9)

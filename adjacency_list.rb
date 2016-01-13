require_relative 'edge_list'
require_relative 'linked_list'

class AdjacencyList

  attr_accessor :al, :el_array

  def initialize(el_array)
    @al = []
    @el_array = el_array
    create_alist
  end


  def create_alist
    @el_array.each do |edge|
      from = edge[0].id
      to = edge[1].id
      if @al[from].nil?
        @al[from] = LinkedList.new(Node.new(edge[0].name))
      end
      if @al[to].nil?
        @al[to] = LinkedList.new(Node.new(edge[1].name))
      end
      @al[from].add_node([edge[1].name, edge[2]])
      @al[to].add_node([edge[0].name, edge[2]])
    end
  end

  def print_alist

    @al.each do |row|
      # from = row[0].name
      row.print_list
    end

  end


end

el = EdgeList.new(4).list

al = AdjacencyList.new(el)
puts ""
al.print_alist
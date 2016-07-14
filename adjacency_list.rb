require_relative 'edge_list'

Node = Struct.new(:id, :name, :weight, :next)

class LinkedList
  attr_reader :head

  def initialize(first_node = nil)
    @head = first_node
    @tail = first_node
  end

  def add_node_end(node)
    if @head == nil
      add_first_node(node)
    else
      @tail.next = node
      @tail = node
    end
  end

  def add_first_node(node)
    @head = node
    @tail = node
  end

  def read_list
    current_node = @head
    while current_node != nil
      p "#{current_node.name}(#{current_node.weight}) "
      current_node = current_node.next
    end
  end

  def find(id)
    current_node = @head
    while current_node != nil
      break if current_node.id == id
      current_node = current_node.next
    end
    current_node.weight if current_node != nil
  end
end

class AdjacencyList

  attr_reader :state

  def initialize(array)
    @state = []
    @data = array
    array.each do |edge|
      insert(edge)
    end
  end

  def insert(edge)
    @state[edge[0].id] ||= LinkedList.new(Node.new(edge[0].id, edge[0].name, nil, nil))
    @state[edge[0].id].add_node_end(Node.new(edge[1].id, edge[1].name, edge[2], nil))
  end

  def edge_weight(id1, id2)
    @state[id1].find(id2)
  end

  def print_adj_list
  end

  def names
    names = @data.map do |row|
      row[0].name
    end
    names.unshift("Bob").insert(2,"Aloc")
  end

end
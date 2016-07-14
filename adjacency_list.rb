class LinkedList
  attr_reader :head, :tail, :size

  def initialize(node = nil)
    @head = node
    @tail = @head
    #Keep track of size.
    @size = 1
  end

  def insert( data, position )
    node = Node.new(data)
    case position
    #Insert at head
    when 0, :head
      node.set_pointer(@head)
      @head = node
    #Insert at tail
    when (@size - 1), :tail
      @tail.set_pointer(node)
      @tail = node
    else
      ith_minus_node = find_node(position)
      node.set_pointer(ith_minus_node.pointer)
      ith_minus_node.set_pointer(node)
    end
    @size += 1
  end

  def reverse_list
    current = @head
    nxt = current.pointer
    current.set_pointer(nil)
    @last = current
    until nxt.nil?
      prv = current
      current = nxt
      nxt = nxt.pointer
      current.set_pointer(prv)
    end
    @head = current
  end

  def find_node(idx)
    i = 0
    #Iteratively search for position in list.
    node_output = @head
    while i < idx - 1
      node_output = node_output.pointer
      i += 1
    end
    node_output
  end

  def find_key(key)
    i = 0
    #Iteratively search for position in list.
    node_output = @head
    while i < @size
      if node_output.data == key
        puts "It took #{i} #{i > 1 ? 'steps' : 'step'} to find this key"
        return node_output
      end
      node_output = node_output.pointer
      i += 1
    end
    nil
  end

  def render_list
    node = @head
    idx = 0
    while node
      puts "--NODE##{idx}--"
      puts "Data: #{node.data}"
      puts "Pointer: #{node.pointer}"
      idx += 1
      node = node.pointer
    end
  end
end

class AdjacencyList

  attr_reader :state

  def initialize(array)
    @state = []
    @data = array
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
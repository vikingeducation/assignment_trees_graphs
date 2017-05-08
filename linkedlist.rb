class LinkedList

	Node = Struct.new(:word, :definition, :next)

  attr_accessor :head, :last

  def initialize(first_node = nil)
    @head = first_node
    @last = @head
  end

  def append_node(word, definition)
    if @head.nil?
      @head = Node.new(word, definition, nil)
      @last = @head
    else
      new_node = Node.new(word, definition, nil)
      @last.next = new_node
      @last = new_node
    end
  end

  def insert_node_at_index(node, index)

    # Big O = O(n)
    
    next_node = find_node(index)
    previous_node = find_node(index - 1)
    new_node = node
    new_node.next = next_node
    previous_node.next = new_node

  end

  def find_node(index)
    
    # Big O = O(n)

    current_node = @head
    counter = 0

    while (counter < index)
      current_node = current_node.next
      counter += 1
    end

    puts "Found node at index #{index} with value: #{current_node.word} - #{current_node.definition}"
    current_node
  end

  def reverse 

    # Big O = O(n)

    previous_node = @head 
    current_node = @head.next 
    while current_node != nil
      current_node.next = previous_node
      previous_node = current_node
      current_node = current_node.next
    end
    @head, @last = @last, @head
  end
end
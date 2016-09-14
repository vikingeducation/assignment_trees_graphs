Node = Struct.new(:data, :next)

class LinkedList
  attr_accessor :head, :last

  def initialize(first_node = nil)
    @head = first_node
    @last = first_node
  end

  #O(n) because size of linked list directly affects length of time to search it
  def find_node(index)
    counter = 0
    current_node = @head

    while counter < index
      current_node = current_node.next
      counter += 1
    end

    puts "Found node at #{index} with value: #{current_node.data}"
  end

  #O(1) because we've already found the node, we just need to move references
  def add_node(data, index = @last)
    if @head.nil?
      @head = Node.new(data, nil)
      @last = @head
    else
      new_node = Node.new(data)
      @last.next = new_node
      @last = new_node
    end
  end

  def add_first_node(data)
    @head = Node.new(data, nil)
    @last = @head
  end

  def print_list
    current = @head
    counter = 0

    while current
      puts "Node at index #{counter} is #{current.data}"
      current = current.next
      counter += 1
    end
  end

  #O(n) new nodes are created
  def reverse
    current = @head
    previous = nil
    until current.nil?
      next_node = current.next
      current.next = previous
      previous = current
      current = current.next
    end
    @head = previous
  end

end
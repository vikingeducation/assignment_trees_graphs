Node = Struct.new(:id, :name, :weight, :next)


# Creates an unordered linked-list
class LinkedList

  # We'll want to keep track of the head node and
  # the last node to make adding and subtracting easy
  attr_accessor :head, :last


  # Allow initializing the list with a first node
  def initialize(first_node = nil)
    @head = first_node
    @last = first_node
  end


  # To add the first node
  def add_first_node(id, name, weight)
    @head = Node.new(id, name, weight)
    @last = @head
  end


  # Add a node to the end of the list
  def add_node(id, name, weight)

    # change tactics if we're adding the first node
    if @head.nil?

      add_first_node(id, name, weight)

    else

      new_node = Node.new(id, name, weight)

      # point the last node to our new one
      @last.next = new_node

      # set our new node as the official last node
      @last = new_node

    end

    puts "Added node with value: #{data}"
  end


  # Remove the node at this position
  # (assume there is one there)
  # We'll crawl the list and save the prev
  def remove_node(index)

    # start at the head
    counter = 0
    current_node = @head
    prev_node = nil

    # crawl to the index position
    while counter < index
      prev_node = current_node
      current_node = current_node.next
      counter += 1
    end

    # now perform the removal (cutting out current_node)
    next_node = current_node.next
    current_node.next = nil       # clear the pointer
    prev_node.next = next_node

    puts "Removed node at index #{index} with value: #{current_node.data}"
  end


  # Return the node at that position, like in an array
  # (no error handling)
  def find_node(index)

    # start at the head
    counter = 0
    current_node = @head

    # crawl to the index position
    # outputs each node value for visibility
    while counter < index
      current_node = current_node.next
      counter += 1
    end

    puts "Found node at index #{index} with value: #{current_node.data}"
    current_node
  end


  # Crawls and prints the list
  def print_list
    counter = 0
    current_node = @head
    loop do
      puts "Node at index #{counter}: #{current_node.data}"
      break if current_node.next.nil?
      current_node = current_node.next
      counter += 1
    end
  end

end
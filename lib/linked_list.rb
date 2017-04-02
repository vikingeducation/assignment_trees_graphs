
Node = Struct.new(:id, :name, :weight, :next)

class LinkedList

attr_accessor :head, :last, :size

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
      # puts "Added node with value: #{word}"
  end

   # Return the node at that position, like in an array - Big-O is O(n)
  def find_node(index)
    # start at the head
    counter = 0
    current_node = @head

    # crawl to the index position
    # outputs each node value for visibility
    while counter < index && (index > 0)
      current_node = current_node.next
      counter += 1
    end
    current_node
  end

   
end

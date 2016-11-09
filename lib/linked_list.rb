# use a struct as node
Node = Struct.new(:word, :definition, :next)

# creates unordered linked-list
class LinkedList

  # track first & last nodes for more efficient operations
  attr_accessor :head, :last

  def initialize(first_node = nil)
    @head = first_node
    @last = first_node
  end

  def add_first_node(word, definition)
    @head = Node.new(word, definition, nil)
    @last = head
  end

  def add_node(word, definition)
    unless head
      add_first_node(word, definition)
    else
      # create node
      new_node = Node.new(word, definition)
      # link new node to end of the list
      @last.next = new_node
      # set node of former last to new last
      @last = new_node
    end
  end

  def length
    length = 0
    current_node = @head
    while current_node
      length += 1
      current_node = current_node.next
    end
    length
  end

  def each
    return enum_for(:each) unless block_given?
    current_node = @head
    while current_node
      yield current_node
      current_node = current_node.next
    end
    self
  end

  def remove_node(index)
    # start at head, index 0
    current_position = 0
    current_node = @head
    # crawl to index position
    while current_position < index
      previous_node = current_node
      current_node = current_node.next
      current_position += 1
    end
    # perform pointer reassignment
    next_node = current_node.next
    current_node.next = nil
    previous_node.next = next_node
  end

  def insert_node(word, definition, insertion_point)
    # create new node
    new_node = Node.new(word, definition)
    # locate index immediately before our insertion point
    previous_node = find_node(insertion_point - 1)
    # set new node's pointer to what previous node was pointing at
    new_node.next = previous_node.next
    # set previous node's pointer to new node
    previous_node.next = new_node
  end

  def find_node(index)
    # start at head, index 0
    current_position = 0
    current_node = @head

    # crawl to index position
    while current_position < index
      current_node = current_node.next
      print "#{current_index}: #{current_node} - "
      current_position += 1
    end

    # return node
    # This process's time complexity = O(n)
    # (Traversal iterates through each node to locate your node)
    current_node
  end

  def print_list
    # start at head
    current_node = @head

    # crawl through all nodes
    loop do
      puts current_node
      break unless current_node.next
      current_node = current_node.next
    end
  end

  # O(n) each node must be traversed once
  def reverse
    current_node = @head
    previous_node = nil
    while current_node
      # connection to the rest of the list
      next_node = current_node.next
      # reversal
      current_node.next = previous_node
      # move forward in list
      previous_node = current_node
      current_node = next_node
    end
    # reassign tail and head
    previous_last = @last
    @last = @head
    @head = previous_last
  end
end

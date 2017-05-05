class LinkedList
  attr_reader :head, :last

  def initialize
    @head = nil
    @last = nil
  end

  def add_node(word, definition)
    new_node = Node.new(word, definition, nil)

    if @head.nil?
      add_first_node(new_node)
    else
      @last.next = new_node
      @last = new_node
    end
  end

  def insert_node_at(word, definition, position) # O(n)
    new_node = Node.new(word, definition, nil)

    if position > 0
      previous_node = read_node_at(position - 1)
      new_node.next = previous_node.next
      previous_node.next = new_node
    else
      new_node.next = @head
      @head = new_node
    end
  end

  def read_node_at(position) # O(n)
    if @head.nil?
      @head
    else
      traverse_list_to(position)
    end
  end

  # O(n), in place
  def reverse
    prev_node = nil
    current_node = @head
    @last = @head

    until current_node.nil?
      next_node = current_node.next
      current_node.next = prev_node
      prev_node = current_node
      current_node = next_node
    end

    @head = prev_node
  end

  private

  def add_first_node(node)
    @head = node
    @last = @head
  end

  def traverse_list_to(position)
    current_node = @head
    list_position = 0
    until current_node.next == @last
      break if list_position == position

      current_node = current_node.next
      list_position += 1
    end

    current_node
  end
end

Node = Struct.new(:word, :definition, :next)

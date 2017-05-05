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

  def read_node_at(person_id) # O(n)
    if @head.nil?
      @head
    else
      traverse_list_to(person_id)
    end
  end

  private

  def add_first_node(node)
    @head = node
    @last = @head
  end

  def traverse_list_to(id)
    current_node = @head

    until current_node.next.nil?
      break if current_node.to_id == id

      current_node = current_node.next
    end

    current_node.to_id == id ? current_node : nil
  end
end

Node = Struct.new(:to_id, :weight, :next)

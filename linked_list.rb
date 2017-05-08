Node = Struct.new(:id, :person_to, :weight, :next)

class LinkedList

  attr_accessor :head, :last

  def initialize(first_node = nil)
    @head = first_node
    @last = @head
  end

  def append_node(id, person_to, weight)
    if @head.nil?
      @head = Node.new(id, person_to, weight, nil)
      @last = @head
    else
      new_node = Node.new(id, person_to, weight, nil)
      @last.next = new_node
      @last = new_node
    end
  end

  def find_node(index)
    
    current_node = @head
    counter = 0

    while (counter < index)
      current_node = current_node.next
      counter += 1
    end

    current_node
  end

end
Node = Struct.new(:name, :id, :weight, :next)

class LinkedList

  attr_accessor :head, :tail

  def initialize(first_node=nil)
    @head = first_node
    @tail = first_node
  end

  def add_first_node(name, id, weight)
    @head = Word.new(name, id, weight, nil)
    @tail = @head
  end

  def add_node(name, id, weight)
    if @head.nil?
      add_first_node(name, id, weight)
    else
      new_node = Node.new(name, id, weight, nil)
      @tail.next = new_node
      @tail = new_node
    end
  end

end

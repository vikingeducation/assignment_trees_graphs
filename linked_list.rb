class LinkedLists
  attr_accessor :head, :tail, :size

  def initialize(first_node = nil)
    @head = first_node
    @tail = first_node
    @size = 0
  end

  def add_first_node(name, weight)
    @head = Node.new(name, weight)
    @tail = @head
  end

  def find_node(index)
    counter = 0
    current_node = @head
    while counter < index
      current_node = current_node.next
      counter += 1
    end
    puts "Found node at index #{index} with value of #{current_node}."
    puts "Number of steps was #{counter}"
  end

  def find_word(word)
    current_node = @head
    counter = 0
    until node.word == word || node == nil
      counter += 1
      current_node = current_node.next
    end
    puts "#{counter} steps to find #{word}"
    return current_node
  end

  def size
    return 0 if @head.nil?
    count = 1
    current_node = @head
    until current_node == @tail
      count += 1
      current_node = current_node.next
    end
    return count
  end

  def insert_node(name, weight, index)
    inserted_node = Node.new(name, weight)
    if index < 1
      inserted_node.next = @head
      @head = inserted_node
    else
      prev = self.find(index - 1)
      fol = self.find(index)
      prev.next = inserted_node
      inserted_node.next = fol
      @tail = inserted_node if fol.nil?
    end
  end

  def add_node(name, weight)
    if @head.nil?
      add_first_node(name, weight)
    else
      new_node = Node.new(name, weight)
      @tail.next = new_node
      @tail = new_node
    end
  end

end
Node = Struct.new(:name, :weight, :next) do def inspect
  "#{name} -> #{self.next.inspect || "nil"}"
end
end

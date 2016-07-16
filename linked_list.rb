require 'pry'

Node = Struct.new(:data, :weight, :next)


class LinkedList

  attr_reader :head, :last

  def initialize(first_node = nil)
    @head = Node.new(first_node)
    @last = @head
  end

  

  def add_node_to_end(data, weight)
    if @head.nil?
      add_first_node(data) 
    else
      new_word = Node.new(data, weight)
      @last.next = new_word
      @last = new_word
    end
    #puts "Added node for #{word} with definition #{definition}."
  end

  def remove_node(index) # 3
    # traverse the nodes untl the node @ index is reached
    # connect the previous node to the next node (next and previous relative to node @ index)

    if index == 0
      puts "Removing note at index #{index}, which is #{@head.word}: #{@head.definition}"
      @head = @head.next
    else
      counter = 0
      current_node = @head 
      prev_node = nil
      while counter < index
        prev_node = current_node
        next_node = current_node.next
        current_node = next_node 
        counter += 1
      end
      next_node = current_node.next
      current_node.next = nil
      prev_node.next = next_node
      puts "Removed node at index #{index}, which was:"
      puts "#{current_node.word}: #{current_node.definition}"
    end
  end

  def read(index)
    # the Big-O value for this operation is O(n), because the scan must start at the beginning and search through all nodes up until (index)
    current_node = scan(index)
    [current_node.word, current_node.definition]
  end

  def scan(index)
    counter = 0
    current_node = @head
    prev_node = nil
    puts "Starting scan at #{counter}."
    while counter < index
      prev_node = current_node
      next_node = current_node.next
      puts "The node at #{counter} is #{current_node}."
      current_node = next_node 
      counter += 1
    end
    current_node
  end

  def find_weight(id)
    current_node = @head
    steps = 0
    if @head.next == nil
      steps += 1
      return false
    else
      until current_node.next == nil
        next_node = current_node.next
        steps += 1
        return next_node.weight if id == next_node.data[0]
        current_node = next_node
      end  
    end
    false
  end

  def count
    counter = 1
    current_node = @head
    until current_node.next == nil
      next_node = current_node.next
      current_node = next_node 
      counter += 1
    end
    counter
  end

  def add_node_at_index(index, word, definition)
    #the Big-O value for this operation is O(n) because a scan of each node up until the node @ index must take place, so time is a function of no. of nodes
    counter = 0
    current_node = @head
    prev_node = nil
    while counter < index
      prev_node = current_node
      next_node = current_node.next
      current_node = next_node 
      counter += 1
    end
    new_node = Node.new(word, definition)
    if prev_node
      prev_node.next = new_node
    else
      @head = new_node
    end
    new_node.next = current_node
  end

  def reverse 
    #the Big-O value for this operation is O(n) because the operation simply traverses the nodes, setting the 'next' value of each to the previous node
    current_node = @head
    prev_node = nil
    @last = @head
    current_copy = @head

    until current_copy.next == nil
      prev_node = current_node
      current_node = current_copy.next
      current_copy = current_node.dup
      current_node.next = prev_node
    end
    @head = current_node
    self
  end





  #private

  def add_first_node(word, definition)
    @last = @head = Node.new(word, definition, nil)
  end


end

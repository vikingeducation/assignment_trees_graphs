require 'pry'

Node = Struct.new(:name, :id, :weight, :next)

class LinkedList

  attr_accessor :head, :last

  def initialize(first_node = nil)
    @head = first_node
    @last = first_node
  end

  def add_first_node(name, id, weight)
    @head = Node.new(name, id, weight, nil)
    @last = @head
  end

  def add_node(name, id, weight)
    if @head.nil?
      add_first_node(name, id, weight)
    else
      new_node = Node.new(name, id, weight)
      @last.next = new_node
      @last = new_node
    end
    puts "Added node!"
  end

  def read_node(index)
    counter = 0
    current = @head
    while counter < index
      current = current.next
      counter += 1
    end
    return "Nothing exists at this node" if current.nil?
    puts "#{counter} steps"
    puts "Node #{index} contains the following information: "
    puts "#{current.name}(#{current_weight})"
  end

  def insert_node(name, id, weight, index)
    counter = 0
    before = @head
    while counter < (index-1)
      before = before.next
      counter += 1
    end
    after = before.next
    insertion = Node.new(name, id, weight)
    before.next = insertion
    insertion.next = after
  end

  def reverse
    prev_node = @head
    curr_node = @head.next
    until curr_node.nil?
      next_node = curr_node.next
      curr_node.next = prev_node
      prev_node = curr_node
      curr_node = next_node
    end
    swap_head_and_tail
  end

  def swap_head_and_tail
    new_last = @head
    new_head = @last
    @head = new_head
    @last = new_last
    @last.next = nil
  end

end
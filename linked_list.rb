Node = Struct.new(:person, :weight, :next)

class LinkedList
  attr_accessor :head, :last

  def initialize(first_node = nil)
    @head = first_node
    @last = first_node
  end

  def add_first_node(person, weight = nil)
    @head = Node.new(person, weight, nil)
    @last = @head
  end

  def add_node_to_end(person, weight = nil)
    if @head.nil?
      add_first_node(person, weight)
    else
      new_node = Node.new(person, weight)
      @last.next = new_node
      @last = new_node
    end
  end

  def add_node_at_index(person, weight = nil, index)
    counter = 0
    current_node = @head
    prev_node = nil

    # crawl to index to set both prev_node and current_node
    while counter < index
      prev_node = current_node
      current_node = current_node.next
      counter += 1
    end

    # add the new node
    new_node = Node.new(person, weight)
    prev_node.next = new_node
    new_node.next = current_node
  end

  # No error handling
  def find_node(index)
    counter = 0
    current_node = @head

    while counter < index
      current_node = current_node.next
      counter += 1
    end

    current_node
  end

  def get_weight(lookup_person)
    counter = 0
    size = self.length
    current_node = @head

    while counter < size
      if current_node.person == lookup_person
        puts "#From #{@head.person} to #{lookup_person}: weight #{current_node.weight}, #{counter} steps"
        return current_node.weight
      else
        current_node = current_node.next
        counter += 1
      end
    end

    puts "I'm sorry, didn't find '#{lookup_person}' in the current dictionary. #{counter} steps."
  end

  def reverse_in_place
    new_head = @last
    reverse_counter = length
    current_reverse_node = @last

    # Change all the nodes' next attribute
    while reverse_counter > 0
      # set the outer loop node's next to the previous node
      prev_node = find_node(reverse_counter - 1)
      current_reverse_node.next = prev_node
      current_reverse_node = prev_node
      reverse_counter -= 1
    end

    # Reset head and last
    @last = current_reverse_node
    @last.next = nil
    @head = new_head
  end

  def length
    counter = 1
    current_node = @head
    while current_node != @last
      current_node = current_node.next
      counter += 1
    end
    # puts "Length is #{counter}."
    counter
  end
end

# x = LinkedList.new
# x.add_node_to_end('hi', 'short for hello')
# x.add_node_to_end('bye', 'short for goodbye')
# x.add_node_to_end('hola', 'Spanish for hello')
# x.find_node(1)
# x.find_node(2)
# x.add_node_at_index('geia sou', "Greek for hello", 1)
# x.length
# x.reverse_in_place
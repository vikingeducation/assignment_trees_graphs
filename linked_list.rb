Node = Struct.new(:person, :weight, :next_node)

class LinkedList

  attr_accessor :head, :last

  def initialize(first_node = nil)
    @head = first_node
    @last = first_node
  end


  def read

    current_node = @head
    until current_node == nil
      #break if current_node.next_node.nil?
      print " #{current_node.person.name}(#{current_node.weight})" 
      current_node = current_node.next_node
    end

  end

  def count
    counter = 1
    current_node = @head
    loop do
      break if current_node.next_node.nil?
      current_node = current_node.next_node
      counter += 1
    end
    counter

  end


  def add_first_node(person, weight)
    @head = Node.new(person, weight, nil)
    @last = @head
  end


  def add_at_index(index, person, weight)
    counter = 0
    current_node = @head

    loop do
      if counter+1 == index
        new_node = Node.new(person, weight, current_node.next_node)
        current_node.next_node = new_node
        current_node = new_node
        break
      end
      current_node = current_node.next_node
      counter += 1
      break if current_node.next_node.nil?
    end

  end

  def add_node(person, weight)

    if @head.nil?
      add_first_node(person, weight)
    else
      new_node = Node.new(person, weight, nil)
      @last.next_node = new_node
      @last = new_node
    end

  end

  def find(id)

    counter = 0
    current_node = @head
    until current_node.person.id == id
      if current_node.next_node.nil?
        puts "Cannot find id #{id}"
        break
      end
      current_node = current_node.next_node
      counter += 1
    end
    current_node

  end

end
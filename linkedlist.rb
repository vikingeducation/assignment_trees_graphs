Node = Struct.new(:to, :weight, :next)



class LinkedList

  attr_accessor :head, :last, :node_count

  def initialize(first_node = nil)
    # can initialize with a first node, or just be an empty list
    @head = first_node
    @last = first_node
    first_node ? @node_count = 1 : @node_count = 0
  end


  def render_list
    current_node = @head
    list = []

    until current_node == nil
      list << [current_node.to, current_node.weight]
      current_node = current_node.next
    end

    list

  end

  
  # this operation has a linear time complexity, as the list grows so does
  # the number of steps involved in crawling it
  def find(index)
    crawler_location = 0
    current_node = @head

    until crawler_location == index

      break if current_node == nil

      #puts "#{current_node.to}: #{current_node.weight} at index #{crawler_location}"
      current_node = current_node.next
      crawler_location += 1

    end

    current_node unless current_node == nil
  end


  def find_to(to)

    current_node = @head

    until current_node.to == to

      current_node = current_node.next

      break if current_node.nil?

    end

    current_node.weight unless current_node.nil?    
    
  end


  # since our list itself doesn't know anything about index, this operation
  # will always have a linear time complexity.  it always has to crawl the list
  # and so as the list growls, so do the steps involved
  def insert(to, weight, index)
    new_node = Node.new(to, weight, nil)

    # handle inserting at the head
    if index == 0

      new_node.next = @head
      @head = new_node

      @last = new_node if @last == nil

      @node_count += 1
    
    # handle an insert at an arbitrary index 
    else

      insertion_node = find(index - 1)

      raise "Index out of range" if insertion_node == nil

      new_node.next = insertion_node.next
      insertion_node.next = new_node

      @last = new_node if @last == insertion_node

      @node_count += 1

    end
  end


  # time complexity here is just constant time, we're re-assigning the @last
  # variable which will also just be a few steps
  def append(to, weight)
    new_node = Node.new(to, weight, nil)

    # is the first node being added?
    if @head == nil
    
      @head = new_node
      @last = new_node

      @node_count += 1
    
    # normal append at the end of the list
    else 

      @last.next = new_node
      @last = new_node

      @node_count += 1

    end
  end


  # has to traverse list for each item in list
  # O(log n) or O(n^2) but each traversal is smaller as it goes
  def reverse
    new_last = @head
    new_head = @last
    node_to_flip = @last

    until node_to_flip == @head

      new_target = find_linked_note(node_to_flip)
      node_to_flip.next = new_target
      node_to_flip = new_target
      
    end

    @head = new_head
    @last = new_last

    @last.next = nil
  end


  def find_linked_note(target_node)
    current_node = @head

    until current_node.next == target_node

      break if current_node == nil

      current_node = current_node.next

    end

    current_node unless current_node == nil
  end
  
end
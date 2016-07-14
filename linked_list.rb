Node = Struct.new(:data, :next)

class LinkedList
  attr_reader :head, :last, :length

  def initialize(first_node = nil)
    @head = first_node
    @last = first_node
    @length = 0
  end

  def add_first_node(data)
    @length += 1
    @head = Node.new(data, nil)
    @last = @head
  end

  def add_node(data)
    if @head.nil?
      add_first_node(data)
    else
      @length += 1
      new_node = Node.new(data, nil)
      @last.next = new_node
      @last = new_node
    end

  end

  # O(n), because it depends linearly on amount of items in list
  def search(index)  # works only on hashes
    current_node = @head
    index.times do
      print current_node.data.to_s + " -> "
      return nil if current_node.next.nil?
      current_node = current_node.next
    end
    puts current_node.data
    current_node
  end

  # O(n), because we have to search for node at index
  def value(index)
    node = search(index)
    return nil if node.nil?
    node.data
  end


  def insert_node(data, index)
    @length += 1
    prior_node = search(index-1)
    new_node = Node.new(data, prior_node.next)
    prior_node.next = new_node
    @last = new_node if prior_node == @last
  end

  def reverse
    current_node = @head
    next_node = @head.next
    @head.next = nil
    prior_node = nil
    @last = current_node
    until next_node.nil?
      prior_node = current_node
      current_node = next_node
      next_node = current_node.next
      current_node.next = prior_node
    end
    @head = current_node
  end

  def find(value) # returns index
    index = 0
    current_node = @head
    until current_node.nil?
      return index if current_node.data ==  value
      current_node = current_node.next
      index += 1
    end
    nil
  end

  def find_key(key) #returns node
    return nil unless @head.data.is_a?(Hash)
    index = 0
    current_node = @head
    until current_node.nil?
      return [index, current_node] if current_node.data.keys.include?(key)
      current_node = current_node.next
      index += 1
    end
    return[index, nil]
  end

  def load(filename)
    word_list = []

    File.readlines(filename).each do |line|
      word_list << line.strip
    end

    word_list
  end

end

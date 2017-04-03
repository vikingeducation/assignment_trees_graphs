class LinkedList
  Node = Struct.new(:to, :weight, :next_node)

  attr_reader :head,
              :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # O(n)
  def read(index = nil)
    if @head.nil?
      puts "There are no nodes available to read."
      return nil
    end

    output = []
    crawler = @head

    # if no index is provided, assume we want to read all available nodes.
    if index.nil?
      i = 0
      while (crawler) do
        output << "#{i}: #{crawler.to} - #{crawler.weight}"
        i += 1
        crawler = crawler.next_node
      end

      return output
    end

    # if an index is provided, check that it's valid.
    if index < 0 || !index.is_a?(Integer)
      puts "Invalid index."
      return nil
    end

    # if an index is provided, read available nodes up to that index.
    for i in (0..index)
      output << "Node #{i} - #{crawler.to} : #{crawler.weight}"

      crawler = crawler.next_node
      break if crawler.nil?
    end

    output
  end

  # O(1)
  def insert_at_end(to, weight)
    node = Node.new(to, weight, nil)

    if @tail.nil?
      @tail = node
      @head = node
    else
      @tail.next_node = node
      @tail = node
    end
  end

  # O(n), where n is the index specified
  def insert_at(index, to, weight)
    # invalid index
    if index < 0
      puts "Invalid index."
      return nil
    end

    # inserting at the beginning
    if index == 0
      if @head.nil?
        @head = Node.new(to, weight, nil)
        @tail = @head
      else
        node = Node.new(to, weight, nil)
        node.next_node = @head
        @head = node
      end
    else
      crawler = @head
      (index - 1).times { crawler = crawler.next_node }

      # inserting at the tail node
      if crawler == @tail
        node = Node.new(to, weight, nil)
        crawler.next_node = node
        @tail = node
      else
        # inserting in between the head and tail nodes
        node = Node.new(to, weight, crawler.next_node)
        crawler.next_node = node
      end
    end
  end

  # O(n), in-place reversal.
  def reverse
    if @head == @tail
      puts "No nodes to reverse."
      return nil
    end

    cursor = nil
    next_node = nil
    @tail = @head

    while (@head) do
      next_node = @head.next_node
      @head.next_node = cursor
      cursor = @head
      @head = next_node
    end

    cursor
  end

  # O(n)
  def length
    0 if @head.nil?

    len = 0
    crawler = @head
    while (crawler)
      crawler = crawler.next_node
      len += 1
    end

    len
  end
end

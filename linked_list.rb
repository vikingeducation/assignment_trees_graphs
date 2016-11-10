Node = Struct.new(:data, :pointer)

class LinkedList

  attr_reader :node_list, :first_node, :last_node

  def initialize(node = nil)
    @first_node = node
    @current_node = node
    @last_node = node
  end

  def node_list
    index = 0
    reset_current_node
    until end_of_list?
      puts "Node #{index}: #{@current_node.data}"
      crawl
      index += 1
    end
    puts "Node #{index}: #{@current_node.data}" unless empty?
  end

  def add(node, index = nil)
    # Big O: O(n). Worst case is crawling to the end of list.
    reset_current_node
    if empty?
      initialize(node)
    else
      unless index
        @last_node.pointer = node
        @last_node = node
      else
        crawl(index - 1) unless index == 0
        # point new node to next node
        node.pointer = @current_node.pointer
        # point current node to new node
        @current_node.pointer = node
        @first_node = node if index == 0
        @last_node = node if node.pointer.nil?
      end
    end
  end

  def read(index)
    crawl(index)
    @current_node.data
  end

  def find(data)
    crawl until end_of_list? || @current_node.data == data
    return false if @current_node.nil? || @current_node.data != data
    @current_node.data
  end

  def remove(index)
    crawl(index - 1)

    unless @current_node.pointer.pointer.nil? #last node
      @current_node.pointer = @current_node.pointer.pointer
      crawl
    end

    @current_node.pointer = nil
    @last_node = @current_node
  end

  def update(data, index)
    crawl(index)
    @current_node.data = data
  end

  def reverse
    # Big O: O(n), goes through whole list once.
    reset_current_node
    next_node = @current_node.pointer
    @current_node.pointer = nil
    @last_node = @current_node

    loop do
      prev_node = @current_node
      @current_node = next_node
      next_node = @current_node.pointer
      @current_node.pointer = prev_node
      break if next_node.nil?
    end

    @first_node = @current_node
  end

  def number_of_nodes
    reset_current_node
    return 0 if empty?
    index = 1
    until end_of_list?
      crawl
      index+=1
    end
    index
  end

  private

    def end_of_list?
      empty? || @current_node.pointer.nil?
    end

    def empty?
      @first_node.nil?
    end

    def reset_current_node
      @current_node = @first_node
    end

    def crawl(index = nil)
      if index
        reset_current_node
        index.times do
          crawl
        end
      else
        @current_node = @current_node.pointer
      end
    end
end

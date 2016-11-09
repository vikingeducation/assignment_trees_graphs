require_relative "queue"
Node = Struct.new(:number, :small_child, :big_child)

class BinaryTree
  attr_reader :root

  def initialize(args = {})
    @initial_data = args[:data]
    @root = args[:root]
  end

  def add_node(number)
    node = create_node(number)
    unless @root
      @root = node
    else
      add_child_node(node)
    end
  end

  def add_child_node(node)
    target_node = crawl(node.number)
    if target_node.number > node.number
       target_node.small_child = node
    else
      target_node.big_child = node
    end
  end

  def crawl(number)
    current_node = @root
    loop do
      if current_node.number < number
        return current_node unless current_node.big_child
        current_node = current_node.big_child
      else
        return current_node unless current_node.small_child
        current_node = current_node.small_child
      end
    end
  end

  def generate_tree(data_set = @initial_data)
    data_set.each { |number| add_node(number) }
  end

  def render
    queue = Queue.new
    queue.enqueue(@root)
    until queue.empty?
      current_node = queue.dequeue
      p current_node.number
      big_child = current_node.big_child
      small_child = current_node.small_child
      queue.enqueue(small_child) if small_child
      queue.enqueue(big_child) if big_child
    end
  end

  private

    def create_node(number)
      Node.new(number, nil, nil)
    end

end

a = BinaryTree.new(data: [8, 10, 3, 1, 6, 14, 4, 7, 13])
a.generate_tree
a.render

class BinaryTree
  Node = Struct.new(:value, :left, :right)

  attr_reader :root

  def initialize(values = nil)
    @root = nil

    values.each { |value| insert(value) } unless values.nil?
  end

  # inserts a value into the BinaryTree
  def insert(value)
    if @root.nil?
      @root = Node.new(value, nil, nil)
      return @root
    end

    current_node = @root
    while (current_node)
      if value <= current_node.value
        if current_node.left.nil?
          current_node.left = Node.new(value, nil, nil)
          return current_node.left
        else
          current_node = current_node.left
        end
      else
        if current_node.right.nil?
          current_node.right = Node.new(value, nil, nil)
          return current_node.right
        else
          current_node = current_node.right
        end
      end
    end
  end

  # prints out the BinaryTree using breadth-first search
  def render
    if @root.nil?
      puts "No nodes to print."
      return nil
    end

    level = 0
    queue = []
    queue << @root
    until queue.empty?
      puts "Level #{level}:"
      queue.length.times do
        print "#{queue.first.value} "
        queue << queue.first.left unless queue.first.left.nil?
        queue << queue.first.right unless queue.first.right.nil?
        queue.shift
      end
      level += 1
      puts
    end
  end
end

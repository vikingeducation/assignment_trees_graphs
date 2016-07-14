Node = Struct.new(:left, :right, :data) do

  def initialize
    @visited = false
  end

  def visit
    @visited = true
  end

  def visited?
    @visited
  end

end

class BinaryTree

  attr_reader :root, :visited

  def initialize(array)
    @root = Node.new(nil, nil, array[0])
    array[1..-1].each {|x| insert(Node.new(nil, nil, x))}
    # @counter
  end

  def insert(node)
    current_node = @root
    loop do
      if node.data > current_node.data
        if current_node.right == nil
          return current_node.right = node
        else
          current_node = current_node.right
          # @counter += 1
        end
      elsif node.data < current_node.data
        if current_node.left == nil
          return current_node.left = node
        else
          current_node = current_node.left
        end
      end
    end
  end

  def render(node)

  end

  def breadth_first_search
    queue = [@root]
    current_node = @root
    until queue.empty?
    end
  end

#       current = r 
#     7    15  
#   4  9  12  17
#  2   10       19

# current_node
# Rule 1: Visit an unvisited adjacent vertex, mark it, enqueue
# Rule 2: No more unvisited adjacent vertices, we dequeue and set that as our
# current vertex. Repeat Rule 1.
# Rule 3: Finished when Rule 1 and 2 no longer available.



end

binary_tree = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])
binary_tree.render(binary_tree.root)

Node = Struct.new(:data, :left, :right)

class BinarySearchTree

  def initialize(array)
    @root = build_node(array[0])
    # order array here
  end

  def build_node(n)
    Node.new(n, nil, nil)
  end

  def add_node(n)
    new_node = build_node(n)
    current_lvl = @root
    while current_lvl

      # if new node is less than or greater than the root
      # if greater, look at :right
      # if no :right, add as :right
      # else look at children of :right
      # if less than, look :left
      # if no :left, add as :left
      # else 
    end

  end

end
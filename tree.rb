class BinaryTree
  attr_accessor :data, :left, :right
  def initialize(data)
    @data = data
  end

  def insert(data)
    if @data < data
      if @right.nil?
        @right = BinaryTree.new(data)
      else
        @right.insert(data)
      end
    else
      if @left.nil?
        @left = BinaryTree.new(data)
      else
        @left.insert(data)
      end
    end
  end
end
binary_tree = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])
binary_tree.insert(data)

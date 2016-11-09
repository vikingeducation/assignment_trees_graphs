Node = Struct.new(:num, :left, :right)

class BinaryTree
  attr_reader :root
  def initialize(arr)
    @root = Node.new(arr[0])

  end

  def build(arr)
    arr.each_with_index
  end

end
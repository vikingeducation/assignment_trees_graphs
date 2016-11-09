Node = Struct.new(:num, :left, :right)

class BinaryTree

  attr_reader :root

  def initialize(arr)
    build(arr)
  end

  def build(arr)
    # sets root as first element
    # loop through rest of array
    # adding onto branches
    # until looped through array

    @root = Node.new(arr[0])

    arr[1..-1].each do |node|
    end

  end

  def add(node, root)
    branch = node.num > root.num ? root.right : root.left
    if branch
      add(node, branch)
    else
      branch = node
    end
  end



end
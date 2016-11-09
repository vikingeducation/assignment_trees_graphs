Node = Struct.new(:num, :left, :right) do
  def add(node)
    side = node.num > num ? :right : :left
    (branch = get(side)) ? branch.add(node) : set(node, side)
  end
  def get(sym)
    send(sym)
  end
  def set(node, side)
    send((side.to_s+"=").to_sym, node)
  end
end

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
    arr[1..-1].each do |num|
      add(num)
    end
  end

  def add(num)
    root.add(Node.new(num)) if root
    root
  end



end
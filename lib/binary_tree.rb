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

  def output(arr)
    # takes an array
    # prints each item one at a time

    # row 1) root.num
    # row 2) root.left root.right
    # row 3) root.left.left  root.left.right root.right.left root.right.right

  end

  def output_converter
    output_array = []

    # method that crawls through the tree (recursive)
  end

            5
          /   \
        2       7
              /  \
             6    9
                /
               8
               
               output_array = []
               queue = [5]

               # seed queue with root

               # pop off top_queue_item in queue
               # check for branches
               # add branches to queue (l, r)
               # push top_queue_item to output_array 
               # loop until queue is empty




end
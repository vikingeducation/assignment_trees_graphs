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

  def output
    # takes an array
    # prints each item one at a time

    # row 1) root.num
    # row 2) root.left root.right
    # row 3) root.left.left  root.left.right root.right.left root.right.right
    breadth_crawler.each do |row|
      p row
    end

  end

  private

    def breadth_crawler
      queue = [root]
      output_array = []
      i = 0
      until queue.length == 0
        node = queue.shift
        queue << node.left << node.right if node
        output_array << []
        output_array[i] << node.num if node
        i += 1
      end
      output_array
      # method that crawls through the tree (recursive)
    end

        #     5
        #   /   \
        # 2       7
        #       /  \
        #      6    9
        #         /
        #        8
               
        #        output_array = []
        #        queue = [5]

        #        # seed queue with root

        #        # pop off top_queue_item in queue
        #        # check for branches
        #        # add branches to queue (l, r)
        #        # push top_queue_item to output_array 
        #        # loop until queue is empty




end
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
    row_length = 1
    breadth_crawler.each_with_index do |cell, index|
      print cell || " "
      if index == (row_length ** 2) - 1
        row_length *= 2
        puts
      end
    end

    # 

  end

  private

    # pushes all
    def breadth_crawler
      queue = [root]
      output_array = []
      until queue.length == 0
        node = queue.shift
        queue << node.left << node.right if node
        output_array << (node ? node.num : nil)
      end
      output_array
    end



    # i is queue count
    # row_counter is row_index

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


        # [[5], [2, 7], [nil, nil, 6, 9], [nil, nil, 8, nil]]

end
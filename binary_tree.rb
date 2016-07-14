require 'pry'

Node = Struct.new :val, :left, :right

class BinaryTree
  attr_reader :arr
  def initialize(arr)
    @root = Node.new(arr[0], nil, nil)
    @arr = arr
  end

  def build(arr)
    arr.each do |val|
      holder = @root
      next if val == @root.val
      # creates a new node using array value
      node = Node.new(val, nil, nil)
      # checks left
      loop do
        if node.val < holder.val
          if holder.left.nil?
            holder.left(node)
            break
          else
            holder = holder.left
          end
        # checks right
        elsif node.val > holder.val
          if holder.right.nil?
            holder.right(node)
            break
          else
            holder = holder.right
          end
        end
      end
    end
  end
end

binary_tree = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])

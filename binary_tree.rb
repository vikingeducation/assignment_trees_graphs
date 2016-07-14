require 'pry'

Node = Struct.new(:left, :right, :data)

class BinaryTree
  attr_accessor :root
  def initialize(array)
    @root = Node.new(nil, nil, array[0])
    array.shift
    @array = array
    @holder = nil
    @top = @root
    @direction = nil
  end


  def add_node(node)
    while @top  
      if node.data > @top.data
        @holder = @top 
        @top = @top.right
        @direction = "right"
      else
        @holder = @top
        @top = @top.left
        @direction = 'left'
      end
    end
    @direction == "left" ? @holder.left = node : @holder.right = node
  end


  def build_tree
    @array.each do |num|
      node = Node.new(nil,nil, num)
      add_node(node)
      # @node = node
    end

  end

  def display_tree
    p @root
    p @holder
    p @top
    p @direction


  end


end

binary_tree = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])
binary_tree.build_tree
binary_tree.display_tree


#[1,2,3,4,5,6,7]

#







# initialize with root node as array[0]
# array#sort
# array.each do |node|
#   add_node(node)
#     if node > root
#       if !!node
#         node.right = node
#     else
#       node.left = node
#     end
#     @root = node
# end

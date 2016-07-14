
Node = Struct.new(:left, :right, :data)

class BinaryTree

  def initialize(array)
    @array = array
    @root = node.new(nil, nil, array[0])
    @node = nil
    @holder = 10
    @direction = nil
  end




  def add_node
    while @root
      if @node.data > @root.data
        @holder = @root
        @root = @root.right
        @direction = right
      else
        holder = @root
        @root = @root.left
        @direction = left
      end

    end

  end


       

  end

  def build_tree
    @array.each do |num| 
      node = Node.new(nil,nil, num)
      add_node(node)
      @node = node
    end

  end
 

end

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


Node = Struct.new(:left, :right, :data)

class BinarySearchTree


  def initialize(array)
    @array = array
    @root = Node.new(nil, nil, array[0])
    @current_node = @root
    build_tree
  end

  def build_tree
    @array.each do |num|
      if num < @current_node.data
        @current_node.left = Node.new(nil, nil, num)
      elsif num > @current_node.data
        @current_node.right = Node.new(nil, nil, num)
      end


    end
  
  end


end



#current_node 
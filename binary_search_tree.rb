#node struct with left right children
Node = Struct.new(:left, :right, :data)

class BinaryTree
  attr_accessor :root, :left_node, :right_node

  def initialize(array)
  	@array = array
	  #sets root node with first element in array
	  @root = Node.new(nil, nil, array[0])
    @current = @root
  end

  def build_tree
  	#iterate though array
    @array[1..-1].each do |data|
      #check if data is less then root
      if data < @root.data
        #call method to add to left of tree
       add_left_node(data)

      elsif data > @root.data
      #method to add data to right side of tree
        add_right_node(data)
      end
    end
    puts @array.inspect
  end

  def add_left_node(data)

    node = Node.new(nil, nil, data)

    (@array.length-1).times do 
      
      if node.data < @current.data && @current.left.nil?
        @current.left = node
        break
      elsif node.data < @current.data && !@current.left.nil?
        @current = @current.left
      end
    end
        

  end

  def add_right_node(data)
    node = Node.new(nil,nil, data)
    (@array.length-1).times do 
      if node.data > @current.data && @current.right.nil?
        @current.right = node
        break
      elsif node.data > @current.data && !@current.right.nil?
        @current = @current.right
      end
    end

  end



end



binary_tree = BinaryTree.new([8,10,3,1,6,14,4,7,13])
binary_tree.build_tree
puts 

#puts binary_tree.inspect





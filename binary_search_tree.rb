Node = Struct.new(:left, :right, :data)

class Node
  def inspect
    "#{data}: #{left}, #{right}"
  end

  def to_s
     "#{data}: #{left}, #{right}"
  end
end

class BinarySearchTree


  def initialize(array)
    @array = array
    @root = Node.new(nil, nil, @array[0])
    @array.shift
    build_tree
  end

  def build_tree
    @array.each do |num|
      
      add_node(@root, num)
    end
    @root
  end

  def add_node(root, num)
    p root
    if num <= root.data && !root.left 
      
      root.left = Node.new(nil, nil, num)   

    elsif num <= root.data && root.left 
      add_node(root.left, num)

    elsif num > root.data && !root.right
      root.right = Node.new(nil, nil, num)

    else  
      add_node(root.right, num)
    end
  end


end

puts BinarySearchTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])




 
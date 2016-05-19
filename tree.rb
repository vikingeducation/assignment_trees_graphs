Node = Struct.new(:data, :left, :right)

class BinaryTree

  attr_reader :root

  def initialize(array)
  	@root = Node.new(array[0], nil, nil)
  	build_tree(array[1..-1])
  end

  def build_tree(nodes)
  	nodes.each do |node|
  	  choose_direction(node)
  	end
  end

  def choose_direction(node, current = @root)
  	if node < current.data
  	  go_left(node, current)
  	else
  	  go_right(node, current)
  	end
  end

  def go_left(node, current)
  	if current.left.nil?
  	  current.left = Node.new(node, nil, nil)
  	else
  		current = current.left
  		choose_direction(node, current)
  	end
  end

  def go_right(node, current)
  	if current.right.nil?
  	  current.right = Node.new(node, nil, nil)
  	else
  	  current = current.right
  	  choose_direction(node, current)
  	end
  end

  def render
  	puts @root
  end

end

test = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])
test.render

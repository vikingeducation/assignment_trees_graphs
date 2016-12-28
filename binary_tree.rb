Node = Struct.new(:value, :left, :right)

class BinaryTree

	attr_accessor :root

	def initialize(array)
		@main_array = array
	end

	def construct
		create_root
		i = 1
		loop do
			value_to_insert = @main_array[i]
			search_down(@root, value_to_insert)
			i += 1
			break if i == @main_array.size
		end
	end

	def print_tree(root, parent, lorr = nil)
		if parent
			puts "child is #{lorr} #{root.value} while parent is #{parent.value}"
		end
		if root.left
			print_tree(root.left, root, "left")
		end
		if root.right
			print_tree(root.right, root, "right")
		end
	end

	def render
		puts "root is #{@root.value}"
		print_tree(@root, nil)
	end

	def search_down(parent, value)
		#p "started seaching down for #{value}"
		if value < parent.value
			if parent.left.nil?
				place_left(parent, value)
			else
				search_down(parent.left, value)
			end
		else
			if parent.right.nil?
				place_right(parent, value)
			else
				search_down(parent.right, value)
			end
		end
	end

	def create_root
		@root = Node.new(@main_array[0], nil, nil)
	end

	def place_left(parent, value)
		#p "placed #{value} left of #{parent.value}"
		parent.left = Node.new(value, nil, nil)
	end

	def place_right(parent, value)
		#p "placed #{value} right of #{parent.value}"
		parent.right = Node.new(value, nil, nil)
	end

	def has_no_left_child?(parent)
		parent.left.nil?
	end

	def has_no_right_child?(parent)
		parent.right.nil?
	end

end

binary_tree = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])
binary_tree.construct
binary_tree.render
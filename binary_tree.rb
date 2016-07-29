# build from an array
# first value is root node
# left tree always has lower values
# right tree always has higher values
# when adding new value
	# if new value less than current node
		# and current node has no LEFT value
			# value becomes Node's LEFT value
		# else there is already a LEFT value
			# move down to that node set it as current node and repeat

	# if new value greater tahn the current node
		# and current node has no RIGHT value
			# new value becomes node's right value
		# else there is already a RIGHT value
			# move down to that node set it as current node and repeat
### NON REPEATING INTEGERS ###

BinaryNode = Struct.new( :left, :right, :int )

#add left
#root_node.left = BinaryNode.new( nil, nil, "bar" )

class BinaryTree

	def initialize( array )

		@root, *@arr = array

		@root_node = BinaryNode.new( nil, nil, @root )

		@last = @root_node

	end


	def add_left_node( int )

		# calls when value is less than current node


	end



	def add_right_node( int )

		# calls when value is greater than current node

	end



	def compare_value

		# checks node against array to add to left or right tree

	end



	def find_node


	end
	# need to process the array which will send each value to the tree to be evaluated

	# the first number will be checked against the root
	# if the number is higher it will then go the the right
		# if will continue to go down to right as long as its
			# HIGHER
			# NEXT NODE isnt nil
		# it will go Left if the number is lower




end


tree = BinaryTree.new( [5,6,1,7,9,12,35,2,36] )

tree.build_tree
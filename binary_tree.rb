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

require 'pry'

BinaryNode = Struct.new( :left, :right, :int )

#add left
#root_node.left = BinaryNode.new( nil, nil, "bar" )

class BinaryTree

	def initialize( array )

		int, *@arr = array

		@root_node = BinaryNode.new( nil, nil, int )

		@last = @root_node

	end


	def build_tree

		@arr.each do | i |

			unless i.nil?

				root = @root_node
				new_node = BinaryNode.new( nil, nil, i )
				check_direction( new_node, root )

			end

		end

	end



	def check_direction( new_node, current_node )
binding.pry
		# first we check if the new node's value is greater than the current_node
		if new_node.int > current_node.int
			# if greater then we need to go right
				# if the right value is nil on the current_node
				if current_node.right == nil

					add_right( new_node, current_node )
					# then we can add the value
				# otherwise, if a node is there, that node becomes the current node
			  else
					# then we pass the current_node and node back through
					current_node = current_node.right
					check_direction( new_node, current_node )
				end
			# elsif the value is less, then we go left
		else # value is less than
				# if the left value is nil on the current_node
				if current_node.left == nil
						# we can add the value
						add_left( new_node, current_node )
					# otherwise, if a node is there, that node becomes the current node
				else
					# then we pass the current_node and node back through
					current_node = current_node.left
					check_direction( new_node, current_node)
				end

		end

binding.pry
	end



	def add_left( new_node, current_node )

		current_node.left = new_node

	end


	def add_right( new_node, current_node )

		current_node.right = new_node

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


	def print_tree( current_node = @root_node )

		binding.pry


	end




end


tree = BinaryTree.new( [5,6,1,7,9,12,35,2,36] )

tree.build_tree

tree.print_tree
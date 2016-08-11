
BinaryNode = Struct.new( :int, :left, :right )

class BinaryTree


	def initialize( array )

		int, *@arr = array

		@root_node = BinaryNode.new( int, nil, nil )

	end


	def build_tree

		@arr.each do | i |

			unless i.nil?

				insert( i )

			end
		end


	end


    def insert( value )

        current_node = @root_node

        while current_node
            if ( value < current_node.int ) && ( current_node.left == nil )

                current_node.left = BinaryNode.new( value, nil, nil )

            elsif  ( value > current_node.int ) && ( current_node.right == nil )

                current_node.right = BinaryNode.new( value, nil, nil )

            elsif ( value < current_node.int )

                current_node = current_node.left

            elsif ( value > current_node.int )

                current_node = current_node.right

            else

                return

            end

        end
    end


end


tree = BinaryTree.new( [5,6,1,7,9,12,4,2,8] )

tree.build_tree


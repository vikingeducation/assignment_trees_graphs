BinaryNode = Struct.new( :left, :right, :int )

class BinaryTree


	def initialize( array )

		int, *@arr = array

		@root_node = BinaryNode.new( nil, nil, int )

	end


	def build_tree

		@arr.each do | i |

			unless i.nil?

				insert( i )

			end

		end

	end


    def insert(value)
        puts "Inserting :" + value.to_s
        current_node = @root
        while nil != current_node
            if (value < current_node.value) && (current_node.left == nil)
                current_node.left = BinaryNode.new(value,nil,nil)
            elsif  (value > current_node.value) && (current_node.right == nil)
                current_node.right = BinaryNode.new(value,nil,nil)
            elsif (value < current_node.value)
                current_node = current_node.left
            elsif (value > current_node.value)
                current_node = current_node.right
            else
                return
            end
        end
    end





end


tree = BinaryTree.new( [5,6,1,7,9,12,4,2,8] )

tree.build_tree

puts "Pre Order Traversal"

tree.preOrderTraversal
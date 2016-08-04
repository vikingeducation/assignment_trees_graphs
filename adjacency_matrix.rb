# the adjacency matrix
# we have a list of persons
# where there connection is weighted
# the matrix is a table listing all the possible connections and weights between two vertices
# the array indexes correspond to IDs
# so Harry connects to Alice, weight 2
# Harry connects to Bob, weight 9

# the first person is FROM VERTEX

# the second person is TO VERTEX

# those are the IDs

# the cells will be populated with the weights

# first we need to generate the list into an array
require 'pry'
require_relative 'edge_list.rb'

class AdjacencyMatrix


	def initialize( edge_list )

		@list = edge_list

	end


	# going through the array
	# check the id for each name
	# the id is the position in the matrix ( BOB = 0,0 )
	# the first element is FROM, ID, TO, ID and WEIGHT
		# So if the first element is
			# [ (Harry, 1), (Alice, 10), 2 ]
			# we would place 2 in the vertex of 1, 10 in a multi-array
		# we would then take the next struct
			# [ (Harry, 1), (Bob, 0), 9 ]
			# we'd place 9 at 1,0
		# if we look up vertex 1,10
			# it would check row 1, column 10
				# there it would find the Harry Alice Persons, where we could pull the x[2] which is the weight

	# so each of the vertices will hold the connection
	# AND when printing we would only pull the x[2] for the weight

	def print

		@list.each do | x |

			puts x
			puts "#{x[0].name} id:#{x[0].id} and #{x[1].name} id:#{x[1].id}   weight: #{x[2]}"

		end

	end




end #/.AdjacencyMatrix


am = AdjacencyMatrix.new( EDGE_LIST )
am.print
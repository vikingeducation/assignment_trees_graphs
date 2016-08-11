
require 'pry'
require_relative 'edge_list.rb'

Edge = Struct.new( :from, :to, :weight )
Node = Struct.new( :name, :id, :weight )

class AdjacencyMatrix



	def initialize( edge_list )

		@list = edge_list
		@arr = []
		@names = []
		@matrix = nil

	end


	# going through the array
	def generate_array

		@list.each do | x |

			@arr << [ x[ 0 ].id, x[1].id, x[2] ]
			@names << [ x[0].id, x[0].name ]
			@names << [ x[1].id, x[1].name ]

		end

		@names.uniq!
		@names.sort!

	end #/.generate_matrix


	def build_matrix

		@matrix = Array.new( @names.count ) { Array.new( @names.count )}

		@arr.each do | x |

			@matrix[ x[0] ][ x[1] ] = x[2]

		end



	end


	def print_matrix


		@matrix.each do | row |

			row.each do | col |

				if col.nil?

					print "0".ljust(3)

				else

					print col.to_s.ljust(3)

				end

			end

			puts ""


		end

	end




end #/.AdjacencyMatrix


am = AdjacencyMatrix.new( EDGE_LIST )
am.generate_array
am.build_matrix
am.print_matrix
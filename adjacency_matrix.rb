
require 'pry'
require_relative 'edge_list.rb'


class AdjacencyMatrix


	def initialize( edge_list )

		@list = edge_list
		@nodes = []

	end


	# going through the array
	def generate_array

		@list.each do | x |

			@nodes << [ x[ 0 ].name, x[ 0 ].id ] unless @nodes.any?( x[0 ].id )
			@nodes << [ x[ 1 ].name, x[ 1 ].id ] unless @nodes.any?( x[ 1 ].id )

		end


binding.pry

	end #/.generate_matrix


	def build_matrix

		@arr.each do | x |

			@matrix[ x[0] ][ x[ 1 ]] = x[ 2 ]

		end


	end


	def print_matrix
		@matrix.each do | row |

			row.each do | col |

				if col.nil?

					print "-"

				else

					print col

				end

			end

			puts "" if row.nil?


		end

	end




end #/.AdjacencyMatrix


am = AdjacencyMatrix.new( EDGE_LIST )
am.generate_array
am.print_matrix
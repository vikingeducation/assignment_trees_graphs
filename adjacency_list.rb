require_relative "edge_list.rb"
require_relative 'linkedlist'


require 'pry'


class AdjacencyList

  def initialize


    @linked = []
    @list = EDGE_LIST
    @names = {}

  end

	def generate_names

		@list.each do | x |

			@names[ x[0].id ] = x[0].name
			@names[ x[1].id ] = x[1].name

		end


	end


  def create_list


    @list.each do | x |

      from =  x[ 0 ].id

       to =  x[ 1 ].id

      weight =  x[ 2 ]

       node = @linked[ from ]

      if  node.nil?

         node = LinkedList.new

         node.add_first_node( [ to, weight ] )

      else

         node.add_node( [ to, weight ] )

      end

      @linked[ from ] =  node

    end

  end



  def print_adj_list


    @linked.each_with_index do | node, index |

      next if  node.nil?

      print @names[ index ].ljust( 8 )

       node.print_list

      puts ""

    end

  end




  def edge_weight( from, to )

    @linked[ from ].find_node( to )

  end

end

list = AdjacencyList.new
list.generate_names
list.create_list
list.print_adj_list
list.edge_weight( 10, 0 )
require_relative 'edge_list'
require_relative 'matrix'

el = EdgeList.new(10,7)
am = AdjacencyMatrix.new(el.list, el.people)
am.print_matrix
am.edge_weight(2, 1)

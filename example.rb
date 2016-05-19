require './edge_list.rb'
require './adjacency_list.rb'

el = EdgeList.new(5, 3).list
al = AdjacencyList.new(el)
puts el
puts
al.buckets.each do |value|
  p value
  puts
end
al.print_adj_list

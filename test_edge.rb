require_relative 'edge_list'



class AdjacencyMatrix
   attr_accessor :list, :name_pool, :weight_pool, :matrix
   
   def initialize(edgelist) 
       @list = edgelist
       @name_pool = []
       @weight_pool = []
       connect_all
       @matrix = Array.new(name_pool.length){Array.new(name_pool.length, " X ")}
       matrix_set
   end
   
   def connect_all
       @list.each do |chain|
           @name_pool[chain[0].id] = chain[0].name if @name_pool[chain[0].id] == nil
           @name_pool[chain[1].id] = chain[1].name if @name_pool[chain[1].id] == nil
           @weight_pool << [[chain[0].id, chain[1].id], chain[2]]
       end
   end
   
   def matrix_set
       @weight_pool.each do |group|
           @matrix[group[0][0]][group[0][1]] = group[1]
           @matrix[group[0][1]][group[0][0]] = group[1]
       end
   end
   
   def print_matrix
      puts ""
      puts "----------------"
      print "   "
      @name_pool.each do |name|
          print name + "  "
      end
      puts ""
      0.upto(@name_pool.length) do |index|
          print @name_pool[index]
          print @matrix[index]
          puts ""
      end
      puts "----------------"
   end
   
   def edge_weight(id1, id2)
       search = [id1, id2].sort
       @weight_pool.each do |weight|
        return weight[1] if weight[0] == search
       end
       return "there's no connection so no weight"
   end
    
end

testcase = EdgeList.new
test_list = testcase.list
puts test_list
puts ""
puts "begin"
l = AdjacencyMatrix.new(test_list)
l.print_matrix
puts l.edge_weight(0,1)
puts l.edge_weight(2,3)
puts l.edge_weight(1,4)
puts l.edge_weight(2,3)
puts l.edge_weight(2,4)

#puts l.name_pool
#print l.matrix
#print l.weight_pool
puts "end"
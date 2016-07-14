require_relative 'edge_list'

class AdjacencyMatrix

  def initialize
    @matrix = Array.new(20) {Array.new(20) { 'X' } }
  end


  def build_matrix
    EDGE_LIST.each do |edge|
        @matrix[(edge[0].id)][(edge[1].id)] = edge[2] 
    end
  end

  def name_builder
    names = {}
    EDGE_LIST.each do |edge|
      next if names.keys.include?(edge[0].id)
      names[edge[0].id]  = edge[0].name
    end
      names
  end




  def print_matrix
    print "        "
    name_builder.each_value do |value|
        print value.center(9)
    end
    @matrix.each_with_index do |row, index|
      print names

    end


    
  end






end
a = AdjacencyMatrix.new
a.build_matrix
a.print_matrix
a.name_builder
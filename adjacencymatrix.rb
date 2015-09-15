require_relative 'edge_list'

class AdjacencyMatrix
  attr_accessor :matrix, :vertices
  def initialize(edge_list)
    get_vertices(edge_list)
    size = @vertices.size
    
    @matrix = Array.new(size){Array.new(size)}

    convert(edge_list)
  end

  def convert(edge_list)
    list = edge_list.list

    #mark all edges
    list.each_with_index do |edge, index|
      v1 = edge[0]
      v2 = edge[1]
      weight = edge[2]

      @matrix[v1.id][v2.id] = weight
      @matrix[v2.id][v1.id] = weight
    end

    #if edge doesn't exist, mark X
    @matrix.each_with_index do |col, x|
      col.each_with_index do |cell, y|
        @matrix[x][y] = "X" if @matrix[x][y].nil?
      end
    end
  end

  def print_list
    # printing table headers
    print "".ljust(10)
    @matrix.each_with_index do |vertex, id|
      print "#{vertices[id].name}".ljust(10)
    end
    print "\n"

    @matrix.each_with_index do |col, x|
      print "#{vertices[x].name}".ljust(10)
      col.each_with_index do |cell, y|
        print "#{cell}".ljust(10)
      end
      print "\n"
    end
  end

  def get_vertices(edge_list)
    @vertices = Array.new

    edge_list.list.each do |edge|
      v1 = edge[0]
      v2 = edge[1]

      @vertices[v1.id] = v1 if @vertices[v1.id].nil?
      @vertices[v2.id] = v2 if @vertices[v2.id].nil?
    end
  end

  def edge_weight(id1, id2)
    if !@matrix[id1].nil? && !@matrix[id1][id2].nil?
      weight = @matrix[id1][id2] 
      puts weight
      weight
    else
      puts "No edge between #{id1}: #{vertices[id1]} and #{id2}: #{vertices[id2]}"
    end
  end
end

e = EdgeList.new
a = AdjacencyMatrix.new(e)
a.edge_weight(1,2)
a.edge_weight(2,0)
a.print_list
e.print_list

require_relative "edge_list"

class AdjacencyMatrix

  def initialize(edge_list)
    @edge_list = edge_list
    @matrix = populate_matrix
  end

  def populate_matrix
    matrix = Array.new(names_array.length){Array.new(names_array.length)}
    @edge_list.each do |array|
       matrix[array[0].id][array[1].id] = array[2]
    end
    matrix
  end

  def ids_array
    ids_arr = []
    @edge_list.each do |persons|
      ids_arr << persons[0].id unless ids_arr.include? persons[0].id
      ids_arr << persons[1].id unless ids_arr.include? persons[1].id
    end
    ids_arr
  end

  def names_array
    names_arr = Array.new(ids_array.length)
    @edge_list.each do |array|
      names_arr[array[0].id] = array[0].name unless names_arr.include? array[0].name
      names_arr[array[1].id] = array[1].name unless names_arr.include? array[1].name
    end
    names_arr
  end

  def edge_weight(id_1, id_2)
    @matrix[id_1][id_2]
  end

  def print_matrix_headers
    print " ".center(7)
    names_array.each { |array| print "#{array}".center(7) }
    print "\n"
  end

  def print_matrix_content
    (@matrix.size).times do |array_no|
      print "#{names_array[array_no]}".center(7)
      @matrix[array_no].each {|idx| idx == nil ? (print "X".center(7)) : (print "#{idx}".center(7))}
      print "\n"
    end
  end

  def print_matrix
    print_matrix_headers
    print_matrix_content
  end


end

am = AdjacencyMatrix.new( EDGE_LIST )
am.print_matrix
am.edge_weight(4,17).inspect
puts "the weight on coord (4, 17) is #{am.edge_weight(4, 17)}"
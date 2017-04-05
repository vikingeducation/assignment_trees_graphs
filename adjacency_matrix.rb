require_relative 'edge_list'

# e = EDGE_LIST.new(10).list

class AdjacencyMatrix
  def initialize(edge_list)
    @edges = edge_list
    @adj_matrix = Array.new(max_id) {Array.new(max_id)}
    @names = {}
  end

  def max_id
    max_num = []
    @edges.each do |edge|
      from, to, weight = edge
      max_num << from.id
      max_num << to.id
    end
    max_num.max + 1
  end

  def build_adj_matrix
    @edges.each do |edge|
      from, to, weight = edge
      @adj_matrix[from.id][to.id] = weight
      @adj_matrix[to.id][from.id] = weight
      @names[from.id] = from.name
      @names[to.id] = to.name
    end
  end

  def max_name_len
    lens = []
    @names.each do |id, name|
      lens << name.length
    end
    lens.max
  end

  def print_matrix
    print " " * (max_name_len + 1)
    @adj_matrix.each_index do |header|
        print @names[header].ljust(max_name_len + 1)
    end
    puts
    @adj_matrix.each_with_index do |row, indexR|
      print @names[indexR].ljust(max_name_len + 1)
      row.each_with_index do |cell, indexC|
        value =  @adj_matrix[indexR][indexC]
        if value
          print "#{value}".ljust(max_name_len + 1)
        else
          print "-".ljust(max_name_len + 1)
        end
      end
      puts
    end
  end

  def edge_weight(first_id, second_id)
    puts @adj_matrix[first_id][second_id]
  end
end
am = AdjacencyMatrix.new( EDGE_LIST)
am.build_adj_matrix
am.print_matrix
am.edge_weight(1, 2)

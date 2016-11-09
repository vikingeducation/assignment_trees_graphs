require_relative "../edge_list.rb"

class AdjMatrix

  attr_reader :matrix, :look_up_table

  def initialize data
    build(data)
  end

  def build(data)
    people = count_people(data)
    @matrix = Array.new(people) {Array.new(people)}
    @look_up_table = Array.new(people) 
    
    data.each do |edge|
      @look_up_table[edge[0].id] ||= edge[0].name
      @look_up_table[edge[1].id] ||= edge[1].name
      row = edge[0].id
      col = edge[1].id
      @matrix[row][col] = edge[2]
    end
    
  end

  def length
    @matrix.length
  end

  def count_people(data)
    max = 0

    data.each do |edge|
      if edge[0].id > max
        max = edge[0].id
      end
      if edge[1].id > max
        max = edge[1].id
      end

    end
    max

  end

  def print_matrix

    @look_up_table.each_with_index do |name, i|
      
    end
  end




end

AdjMatrix.new(EDGE_LIST).matrix.each do |row|
  print row
  puts
end
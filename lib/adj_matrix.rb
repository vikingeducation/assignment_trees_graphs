require_relative "../edge_list.rb"

class AdjMatrix

  attr_reader :matrix, :look_up_table

  def initialize data
    build(data)
  end

  def build(data)
    people = count_people(data)
    @matrix = Array.new(people) { Array.new(people) }
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

    max + 1 # IDs start at index 0
  end

  def edge_weight(id1, id2)
    @matrix[id1][id2]
  end

  def print_matrix
    print "        "
    @look_up_table.each do |name|
        print "#{name.center(8)}"
    end
    puts

    @matrix.each_with_index do |row, i|
      print "#{look_up_table[i].center(8)}"
      row.each do |weight|
          print weight.nil? ? "#{"-".center(8)}" : "#{weight.to_s.center(8)}"
      end
      puts
    end
  end
end

AdjMatrix.new(EDGE_LIST).print_matrix

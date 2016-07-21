require_relative "./edge_list.rb"

class AdjacencyMatrix

  def initialize(edge_list)
    @edge_list = edge_list
    @people = list_to_people
    sort_people
    size = count_vertices
    @matrix = Array.new(size){Array.new(size){0}}
    add_weights
  end

  def list_to_people
    people = []
    @edge_list.each do |n|
      people << n[0] unless people.include?(n[0])
      people << n[1] unless people.include?(n[1])
    end
    people
  end

  def sort_people
    @people.sort_by(&:id)
  end

  def count_vertices
    @people.length
  end

  def add_weights
    @edge_list.each do |edge|
      @matrix[edge[0].id-101][edge[1].id-101] = edge[2]
      @matrix[edge[1].id-101][edge[0].id-101] = edge[2]
    end
  end

  def edge_weight(id1, id2)
    @matrix[id1 - 101][id2 - 101]
  end

  def print_matrix
    print " " * 14
    @people.each do |name|
      print "%10s" % name.name
    end
    puts
    @matrix.each_with_index do |row, i|
      print "%14s" % @people[i].name
      row.each_with_index do |col, y|
        @matrix[y][i] == 0 ? (print "%10s" % "X") : (print "%10s" % @matrix[y][i])
      end
      puts
    end
  end

end
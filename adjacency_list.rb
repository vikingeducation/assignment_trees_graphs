require_relative './edge_list.rb'

class AdjacencyList

  attr_reader :people, :edge_list, :adj_list

  def initialize(edge_list)
    @edge_list = edge_list
    @people = list_to_people
    sort_people
    @adj_list = Array.new(@people.length){[]}
    populate_adj_list
  end

  def populate_adj_list
    @edge_list.each do |edge|
      @adj_list[edge[0].id - 101] << [edge[1], edge[2]]
      @adj_list[edge[1].id - 101] << [edge[0], edge[2]]
    end
  end

  def sort_people
    @people.sort_by(&:id)
  end

  def print_adj_list
    @matrix.each_with_index do |row, i|
      print "%14s" % @people[i].name
      row.each_with_index do |col, y|
        print "%10s" % @adj_list[y][i][0]
        print @adj_list[y][i][1]
      end
      puts
    end
  end
    # 0..5

    # people[0].name Joe(6), Olga(4), Garrett(7)

  # ["Mike"] => []
  # ["Mike"] => [[p1, p2, weight]]
  # ["Mike"] => [[p2, weight]]
  # []
  # []
  # []

  # print
  #   person.name,


  def list_to_people
    people = []
    @edge_list.each do |n|
      people << n[0] unless people.include?(n[0])
      people << n[1] unless people.include?(n[1])
    end
    people
  end

end
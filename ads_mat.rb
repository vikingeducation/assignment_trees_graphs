require_relative 'edge_list'

class AdjacencyMatrix

  def initialize(edge_list)
    
    #@hash = {}
    @num_of_person = 4 #build_hash(edge_list)
    @arr = Array.new(@num_of_person) { Array.new(@num_of_person) }
    
    @people = Array.new(@num_of_person)
    build_array(edge_list)
  end

  def build_array(el)

    el.list.each do |edge|
      row = edge[0].id
      col = edge[1].id
      @arr[row][col] = edge[2]
      @people[row] = edge[0].name
      @people[col] = edge[1].name
    end

  end

  def edge_weight(id_1, id_2)
    @arr[id_1][id_2]
  end

  def print_matrix
    space = " "
    printf "%-8s", space
    @people.each {|name| printf "%12s", name}
    print "\n"
    @arr.each_with_index do |row, index|
      unless @people[index].nil?

          printf "%-8s", @people[index]

          row.each { |ele| printf "%12s", ele ||= "X"}
          print "\n"
      end

    end

  end
end















require_relative 'edge_list'

class AdjacencyMatrix

  def initialize(edge_list)
    @matrix=Array.new(20){Array.new(20, "X")}
    @id_to_names = get_names(edge_list)

    edge_list.each do |edge|
      origin_person=edge[0]
      destination_person=edge[1]
      weight=edge[2]
      @matrix[origin_person.id][destination_person.id]=weight
    end
  end

  def print_matrix
    puts column_headings
    str = ""
    (0..19).each do |row|
      str << "#{@id_to_names[row].ljust(length_of_longest_name + 1)}" 
      (0..19).each do |column|
        str << "#{@matrix[row][column].to_s.ljust(length_of_longest_name + 1)}"
      end
      str << "\n"
    end
    puts str
  end

  def get_names(edge_list)
    id_to_names={}
    edge_list.each do |edge|
      id_to_names[edge[0].id]=edge[0].name
      id_to_names[edge[1].id]=edge[1].name
    end
    id_to_names
  end

  def column_headings
    str = ""
    str << " " * (length_of_longest_name + 1)
    (0..19).each do |index|
      str << "#{@id_to_names[index].ljust(length_of_longest_name + 1)}"
    end
    str
  end

  def length_of_longest_name
    @id_to_names.values.reduce(0) do |memo, name|
      if name.length > memo
        name.length
      else
        memo
      end
    end
  end

end

am=AdjacencyMatrix.new(EDGE_LIST)

# p am.get_names(EDGE_LIST).keys

# p am.length_longest_name

# puts am.column_headings

am.print_matrix


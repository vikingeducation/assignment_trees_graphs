require_relative "../edge_list"

class AdjacencyMatrix

  attr_reader :adj_matrix, :person_structs

  def initialize(edge_list)
    person_from = edge_list.map { |row| row[0] }
    person_to = edge_list.map { |row| row[1] }
    @person_structs = (person_from + person_to).uniq.sort_by { |struct| struct.id }
    @adj_matrix = Array.new(person_structs.length) { Array.new(person_structs.length) }
    edge_list.each { |row| @adj_matrix[row[0].id][row[1].id] = row[2] }
  end

  def print_matrix
    @person_structs.each { |struct| print "#{struct.name} #{" "}"}
    puts "\n"
    @adj_matrix.each do |row|
      @person_structs.each { |struct| print "#{struct.name} #{" " * 2} #{row}\n" }
    end
    nil
  end

  def edge_weight(from_id, to_id)
    raise ArgumentError, "Both inputs must be >= 0!" unless
      from_id.between?(0, 20) && to_id.between?(0,20)

    @adj_matrix[from_id][to_id]
  end
end
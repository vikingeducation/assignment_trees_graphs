require_relative './edge_list'

class AdjacencyMatrix
  attr_reader :state

  def initialize(array)
    @state = []
    @data = array
    array.each do |row|
      insert(row)
    end
    # rows = make_rows(array)
  end

  def insert(elem)
    @state[elem[0].id] ||= Array.new(20)
    @state[elem[1].id] ||= Array.new(20)
    @state[elem[0].id][elem[1].id] = elem[2]
    @state[elem[1].id][elem[0].id] = elem[2]
  end

  def names(array)
    names_variable = array.map do |edge|
      edge[0].name
    end
    names_variable.uniq.unshift("Bob")
  end

  def print
    @state.each_with_index do |row, index|
      p "#{names(@data)[index].ljust(10)} #{row.map { |cell| cell ? cell.to_s.ljust(3) : " ".ljust(3) }.join('')}"
    end
  end

  def edge_weight(num1, num2)
    p @state[num1][num2]
  end

  # def make_rows(array)
  #   array.map do |row|
  #     row[0].name
  #   end
  # end

end

a = AdjacencyMatrix.new(EDGE_LIST)
a.print

# puts a.state.all? { |row| row.length == 20 }
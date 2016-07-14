require_relative './edge_list'

class AdjacencyMatrix
  attr_reader :state

  def initialize(array)
    @state = []
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

  def print
    @state.each do |row|
      row.map { |cell| cell ? cell.to_s : " " }.join('')
    end
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
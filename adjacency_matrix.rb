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
    names_variable.uniq.unshift("Bob").insert(6,"Aloc")
  end

  def print
    rows = []
    names = names(@data)
    @state.each_with_index do |row, index|
      rows << "#{names[index].ljust(10)} #{row.map { |cell| cell ? cell.to_s.ljust(3) : "0".ljust(3) }.join('')}"
    end
    max_name_length = names.max{|a,b| a.length <=> b.length}.length
    justified_names = names.map{|name| name.ljust(max_name_length)}
    max_row_width = justified_names.length
    puts justified_names.join('')
    rows.each do |row|
      puts row.ljust(max_row_width)
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


require_relative 'edge_list'

class AdjacencyMatrix
  
  attr_reader :uniq

  def initialize

  @new_array = []
  EDGE_LIST.each do |item|
    @new_array << item[0]
  end
  @new_array.uniq!
  @new_array.each do |item|
    print item.name.center(10)
  end

end

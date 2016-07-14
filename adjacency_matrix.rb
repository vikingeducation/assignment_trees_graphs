#adjacency_matrx.rb
require_relative 'edge_list'

class AdjacencyMatrix
attr_reader :arr
  def initialize(list)
    @arr = Array.new(20) { Array.new(20, nil) }
    @list = list
  end

  def build
    @list.each do |row|
        @arr[row[0].id][row[1].id] = row[2]
        # binding.pry
    end
  end

  def render
    str = "____"
    @arr.each do |row|
      row.each do |item|
        print item.nil? ? "#{str.to_s.center(4)} " : "#{item.to_s.center(4, "__")} " 
      end
      puts
    end
  end
end

# testing
a = AdjacencyMatrix.new(EDGE_LIST)
a.build
a.render

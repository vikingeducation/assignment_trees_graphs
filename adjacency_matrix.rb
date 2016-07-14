require_relative 'edge_list'
require 'pry'

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
    @arr.each do |row|
      row.each do |item|
        print item.nil? ? "|_|" : item.to_s.center(3)
      end
      puts
    end
  end

end




# testing
a = AdjacencyMatrix.new(EDGE_LIST)
a.build
a.render

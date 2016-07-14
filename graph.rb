

require_relative 'edge_list'
require 'pry'

class AdjacencyMatrix

  attr_reader :names, :adj_matrix

  def initialize(array)
    @lookup_hash = {}
    matrix_size = matrix_sizer(array)
    @adj_matrix = Array.new(matrix_size){ Array.new(matrix_size, nil)}
    build_matrix(array)
  end

  def matrix_sizer(array)
    array.each do |item|
        @lookup_hash[item[0].id] = item[0].name
        @lookup_hash[item[1].id] = item[1].name
    end
    @lookup_hash.keys.count
  end

  def build_matrix(array)
    array.each do |ele|
      @adj_matrix[ele[0].id][ele[1].id] = ele[2]
    end
  end
end

am = AdjacencyMatrix.new(EDGE_LIST)
p am

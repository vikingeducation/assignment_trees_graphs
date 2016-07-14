require_relative 'edge_list.rb'
require 'linked_list.rb'

class AdMat
  attr_accessor :matrix

  def initialize
    @matrix = []
  end

  def import(elist)
    num_users = find_num_users(elist)
    @matrix = Array.new(num_users){Array.new(num_users)}
    elist.each do |edge|
      @matrix[edge[0].id-1][edge[1].id-1] = edge[2]
    end

  end

  def find_num_users(elist)
    max = 0
    elist.each do |edge|
      max = edge[0].id if edge[0].id > max
      max = edge[1].id if edge[1].id > max
    end
    max
  end


end

    # pseudocode
    # define nodes as (name/weight, next)
    # -create array of names in id order
    # -people.each_with_index do |person, index|
    #   temp = LinkedList.new
    #     person[index].each_with_index do |connection, index|
    #       temp.add_node("#{people[index]}(#{connection})) unless connnection.nil?
    #     end
    #     array[index] = temp
    #   end

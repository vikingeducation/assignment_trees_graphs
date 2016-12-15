require_relative 'edge_list.rb'
require 'pry'

class AdjacencyMatrix

  attr_accessor :edges, :matrix, :people

  def initialize(edge_list)
    @edges = edge_list
    collect_people
    @number_of_people = how_many_people
  end

  def how_many_people
    number_of_people = []
    @edges.each do |edge|
      number_of_people << edge[0].id
      number_of_people << edge[1].id
    end
    number_of_people.max + 1
  end

  def collect_people
    @people = []
    @edges.each do |origin, destination, weight|
      @people << origin unless @people.include?(origin)
      @people << destination unless @people.include?(destination)
    end
    @people.sort_by! { |person| person.id }
  end

  def rough_matrix
    @matrix = Array.new(@number_of_people) {Array.new(@number_of_people, "X")}
    @edges.each do |edge|
      row = edge[0].id
      col = edge[1].id
      @matrix[row][col] = edge[2]
    end
    @matrix
  end

  def print_matrix
    @spacing = find_spacing
    horizontal_axis
    (0..(@number_of_people-1)).each do |index|
      vertical_axis(index)
      weights(index)
    end
  end

  def find_spacing
    collect_people
    @people.sort_by { |person| person.name.length }
    @people[-1].name.length + 5
  end

  def horizontal_axis
    print " " * @spacing
    @people.each do |person|
      print "#{person.name}".ljust(@spacing)
    end
    puts
  end

  def vertical_axis(user_index)
    print "#{@people[user_index].name}".ljust(@spacing)
  end

  def weights(index)
    @matrix[index].each do |weight|
      print "#{weight}".ljust(@spacing)
    end
    puts
  end
end

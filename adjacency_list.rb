require_relative 'edge_list.rb'
require_relative 'linked_list.rb'
require 'pry'

class AdjacencyList

  attr_accessor :edges, :people, :relationships, :relationships_list

  def initialize(edges)
    @edges = edges
  end

  def collect_people
    @people = []
    @edges.each do |origin, destination, weight|
      @people << origin unless @people.include?(origin)
      @people << destination unless @people.include?(destination)
    end
    @people.sort_by! { |person| person.id }
  end

  def map_relationships
    relationships = []
    @people.each do |person|
      relationships[person.id] = []
      @edges.each do |edge|
        if person == ( edge[0] || edge[1] )
          relationships[person.id] << edge
        end
      end
    end
    @relationships = relationships
  end

  def build_list
    @relationships_list = Array.new(@relationships.size)

    @relationships.each_with_index do |relationship, index|
      if relationship.empty?
        next
      else
        relationship.each do |origin, destin, weight|
          if @relationships_list[index].nil?
            @relationships_list[index] = LinkedList.new
          end
          @relationships_list[index].add_node(destin.name, destin.id, weight)
        end
      end
    end
    @relationships_list
  end

  def print_adj_list
    @spacing = find_spacing
    @people.each_with_index do |person, index|
      print "#{person.name}".ljust(@spacing)
      print_list(index)
      puts
    end
    return
  end

  def print_list(index)
    if @relationships_list[index].nil?
      print "X"
    else
      curr_node = @relationships_list[index].head
      loop do 
        print "#{curr_node.name}(#{curr_node.weight})"
        curr_node = curr_node.next
        break if curr_node.nil?
        print ", "
      end
    end
  end

  def find_spacing
    collect_people
    @people.sort_by { |person| person.name.length }
    @people[-1].name.length + 5
  end

  def edge_weight(id1, id2)
    return "No edge!" if @relationships_list[id1].nil?
    curr_node = @relationships_list[id1].head
    loop do
      if curr_node.id == id2
        puts curr_node.weight
        break
      else
        curr_node = curr_node.next
        break if curr_node.nil?
        end
      end
    end
  end

end


=begin

load 'adjacency_list.rb'
a = AdjacencyList.new( EDGE_LIST )
a.collect_people
a.map_relationships
a.build_list
a.print_adj_list

=end
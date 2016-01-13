
require_relative './edge_list.rb'

Node = Struct.new( :name, :value ) 

class AdjacencyList
    def initialize(edges)
        @people = edges.people
        @edges = edges.list
        @size = @people.length
        @adj_list = Array.new(@size, [])
        @people_hash = {}
        build_adjacency_list
    end

    def build_adjacency_list

      @people.each_with_index do |person, index|
        @people_hash[person.name] = index
      end
      @edges.each do |edge|
        person1 = @people_hash[edge[0].name]
        person2 = @people_hash[edge[1].name]
        @adj_list[person1] << Node.new( edge[1].name, edge[2] )
        @adj_list[person2] << Node.new( edge[0].name, edge[2] )
      end
    end

end

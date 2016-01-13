

require_relative './edge_list.rb'

class AdjacencyMatrix
    attr_reader :people_hash, :edges
    def initialize(edges)
      @people = edges.people
      @edges = edges.list
      @size = @people.length
      @matrix = Array.new(@size) { Array.new(@size, 0) } 
      build_matrix
    end

    def build_matrix
      #row and column = person
      #weight = 
      @people_hash = {}
      @people.each_with_index do |person, index|
        @people_hash[person.name] = index
      end
      @edges.each do |edge|
        person1 = @people_hash[edge[0].name]
        person2 = @people_hash[edge[1].name]
        @matrix[person1][person2] = edge[2]
        @matrix[person2][person1] = edge[2]
      end
      @people_hash
    end

    def print_matrix
      counter = 0
      print "    #{@people_hash.keys} \n"
      @matrix.each do |row|
        print @people_hash.keys[counter]
        row.each do |weight|
          print "    #{weight}    "
        end
        counter += 1
        puts
      end
    end


end

el = EdgeList.new( 4 )
am = AdjacencyMatrix.new( el )

am.print_matrix
#print am.people_hash
#sprint am.edges




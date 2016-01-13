# Creates an Edge List of People
# e.g. [  [Person1, Person2, weight], 
#         [Person4, Person8, weight],
#         ... ]
require 'pry-byebug'

Person = Struct.new(:id, :name)

NAMES = [
  "Harry", "Sally", "Sam", "Michael", "Michelle", "Alok", "Dan", "Nick", "Olga", "Alice", "Joseph", "Donald", "Garrett", "Xin", "Mike", "Adam", "Peter", "Andur", "Tom", "Boris"
  ].sort

# For fake randomness
PIDIGITS = ["3", "1", "4", "1", "5", "9", "2", "6", "5", "3", "5", "8", "9", "7", "9", "3", "2", "3", "8", "4", "6"] 



class EdgeList

  attr_reader :list

  # Max members are 20
  # Density is a number between 1-10 which gives the 
  #   overall density of edges in the list
  def initialize( list_members = 20, density = 4 )
    
    list_members = [[list_members, NAMES.size].min, 2].max
    density = [[density, 10].min, 0].max

    @people = build_people( list_members )
    @list = build_list( density )

  end


  def build_people( list_members )
    people = []
    NAMES[0..list_members-1].each_with_index do |name,i| 
      people << Person.new( i, name )
    end
    return people
  end


  def build_list( density )

    list = []
    possible_pairs = @people.combination(2)

    possible_pairs.each_with_index do |pair, idx|

      digits_index = idx % PIDIGITS.size

      # Again, pseudo-randomness...
      if PIDIGITS[digits_index].to_i < density
        weight = digits_index + 1
        list << pair + [weight] 
      end
    end

    puts "EDGE LIST SIZE: #{list.size}"

    list
  end


  def print_list
    puts "Your Edge List:"
    puts @list.inspect
    puts "****************"
  end

end

class AdjacencyMatrix

  attr_accessor :el_array, :matrix, :person_array

  def initialize(el_array)
    @el_array = el_array
    
    @matrix = Array.new(@el_array.size){Array.new(@el_array.size,"X")}
    
    @person_array = Array.new(@el_array.size)

    create_adjacency_matrix
    create_person_array 
  end

  def create_person_array   
    @el_array.each do |edge| 
      puts "EDGE = #{edge[0].id}, #{edge[1].id}"

      @person_array[[edge[0].id]] = edge[0]
      @person_array[[edge[1].id]] = edge[1]
      
    end  
    puts "person_array #{person_array}"
  end

  def create_adjacency_matrix
    
    @el_array.each do |edge| 
      @matrix[edge[0].id][edge[1].id] = edge[2]
    end  
  end 


  def print_adjacency_matrix
    puts "IN PRINT"
    @person_array.each do |person|
      print person
    end  
    @el_array.each do |edge| 
      @matrix[edge[0].id][edge[1].id] = edge[2]
    end  
  end

end 

  
# Test Script

#e = EdgeList.new(4,2)
#e.print_list

el = EdgeList.new(4).list
#p "Created EL #{el}"
am = AdjacencyMatrix.new(el)
print am.matrix
am.print_adjacency_matrix
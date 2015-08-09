# Creates an Edge List of People
# e.g. [  [Person1, Person2, weight], 
#         [Person4, Person8, weight],
#         ... ]

Person = Struct.new(:id, :name, :email)

class EdgeList

  Names = [
  "Harry", "Sally", "Sam", "Michael", "Michelle", "Alok", "Dan", "Nick", "Olga", "Alice", "Joseph", "Donald", "Garrett", "Xin", "Mike", "Adam", "Peter", "Andur", "Tom", "Boris"
  ]

  attr_reader :list, :people

  def initialize( num_people = 5 )
    num_people = [ num_people, Names.length ].min  # validation
    @people = build_people( num_people )
    @list = build_list
  end


  def build_people( num_people )
    people = []
    num_people.times do | id |
      people << self.build_person(id)
    end
    people
  end


  def build_person( id )
    name = Names.shuffle!.pop
    email = "#{name}#{id}@bar.com"
    Person.new( id, name, email )
  end


  # Adds a new edge
  # Weight is the range of possible weights
  # scarcity is the % odds of no edge
  def build_list( weight_factor = 10, no_edge_odds = 50 )

    list = []
    possible_pairs = @people.combination(2)
    
    possible_pairs.each do |pair|

      # break if there shouldn't be an edge at all
      break if ( rand( 1..no_edge_odds ) / 100.0 ).round(1) == 0

      weight = rand( 1..weight_factor )
      list << pair + [weight] 
    end

    list
  end


  def print_list
    puts "Your Edge List:"
    puts @list.inspect
    puts "****************"
  end

end


# Test Script

# e = EdgeList.new
# e.print_list

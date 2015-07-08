# Creates an Edge List of People
# e.g. [  [Person1, Person2, weight], 
#         [Person4, Person8, weight],
#         ... ]

Person = Struct.new(:id, :name, :email)

Names = [
  "Harry", "Sally", "Sam", "Michael", "Michelle", "Alok", "Dan", "Nick", "Olga", "Alice", "Joseph", "Donald", "Garrett", "Xin", "Mike", "Adam", "Peter", "Andur", "Tom", "Boris"
  ]


class EdgeList

  attr_reader :list

  def initialize( num_people = 5 )
    num_people = [ num_people, Names.length ].min  # validation
    @people = build_people( num_people )
    @list = build_list
  end


  def build_people( num_people )
    people = []
    1.upto( num_people ) do | id |
      people << self.build_person( id + 100 )
    end
    people
  end


  def build_person( id )
    name = Names.sample
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

e = EdgeList.new
e.print_list
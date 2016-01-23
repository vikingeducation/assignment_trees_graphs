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

    # This .min/.max styles sets a range.
    list_members = [[list_members, NAMES.size].min, 2].max
    density = [[density, 10].min, 0].max

    @people = build_people( list_members )
    @list = build_list( density )

  end


  def build_people( list_members )
    people = []
    NAMES[0..list_members-1].each_with_index do |name,i| 
      # Creating new people structs and popping them into our people array.
      people << Person.new( i, name )
    end
    return people
  end

  # Building a list of edges.
  def build_list( density )

    list = []
    # This returns an Enumerator object with all two possible combinations.
    # possible_pairs = @people.combination(2) 

    # Running a each_with_index on that enumerator I don't see why we couldn't just do that straight up.
    @people.combination(2).each_with_index do |pair, idx|

      # 0 % 21 etc etc etc
      digits_index = idx % PIDIGITS.size

      # Again, pseudo-randomness...
      # First off al the numbers in PIDIGITS are LESS than 10.
      # Max density is 10
      # Making our weight and adding that with our pair to the list.
      if PIDIGITS[digits_index].to_i < density
        weight = digits_index + 1
        list << pair + [weight]
      end
    end

    # Returning the list
    puts "EDGE LIST SIZE: #{list.size}"

    list
  end

  # Returns a string containing a human readable representation of an object. Talking about the inspect method.
  def print_list
    puts "Your Edge List:"
    puts @list.inspect
    puts "****************"
  end

end

# Test Script

# e = EdgeList.new(2, 10)
# e.print_list

=begin
  adj_matrix =    [
                    [ nil, nil, 1,   7,   23  ],
                    [ nil, nil, 3,   12,  43  ],
                    [ 1,   3,   nil, 12,  43  ],
                    [ 7,   12,  12,  nil, 43  ],
                    [ 23,  43,  43,  43,  nil ],
                  ]
  adj_matrix[0] == person_1
  adj_matrix[1] == person_2
  adj_matrix[2] == person_3
  adj_matrix[3] == person_4
  adj_matrix[4] == person_5
  # That's why [0,0] == nil because a person cant be connected to themselves.
  # Also in the above example, [0,1] and [1,0] are nil because they don't have a connection.

=end
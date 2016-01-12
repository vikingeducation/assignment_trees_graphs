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

  def initialize( list_members = 20 )
    list_members = [list_members, NAMES.size].min
    @people = build_people( list_members )
    @list = build_list
  end


  def build_people( list_members )
    people = []
    NAMES[0..list_members-1].each_with_index do |name,i| 
      people << Person.new( i, name )
    end
    return people
  end


  def build_list

    list = []
    possible_pairs = @people.combination(2)

    possible_pairs.each_with_index do |pair, idx|

      digits_index = idx % PIDIGITS.size

      # Again, pseudo-randomness...
      if PIDIGITS[digits_index].to_i < 4
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


# Test Script

e = EdgeList.new(20)
e.print_list

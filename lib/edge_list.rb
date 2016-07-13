
# Struct
Person = Struct.new(:id, :name)


class EdgeList
  attr_reader :list

  # Collection
  PEOPLE = [
    Person.new(0, "Bob"),
    Person.new(1, "Harry"),
    Person.new(2, "Sally"),
    Person.new(3, "Sam"),
    Person.new(4, "Michael"),
    Person.new(5, "Michelle"),
    Person.new(6, "Alok"),
    Person.new(7, "Dan"),
    Person.new(8, "Nick"),
    Person.new(9, "Olga"),
    Person.new(10, "Alice"),
    Person.new(11, "Donald"),
    Person.new(12, "Garrett"),
    Person.new(13, "Xin"),
    Person.new(14, "Mike"),
    Person.new(15, "Adam"),
    Person.new(16, "Peter"),
    Person.new(17, "Andur"),
    Person.new(18, "Tom"),
    Person.new(19, "Boris"),
    Person.new(20, "Fred")
  ]


  # Config
  MIN_EDGES = 0
  MAX_EDGES = 5
  MIN_WEIGHT = 1
  MAX_WEIGHT = 20
  MIN_PEOPLE = 2


  # Initialize with number of people in list
  # and number of edges between them
  def initialize(num_people=20, num_edges=4)
    @list = create_edge_list(num_people, num_edges)
  end



  private
  def create_edge_list(num_people, num_edges)

    # Limit the max edges
    max_edges = [MAX_EDGES, num_edges].min

    # Must have at least minimum people
    num_people = [MIN_PEOPLE, [PEOPLE.length, num_people].min].max
    people = PEOPLE.first(num_people)


    # Create an array to
    # hold the edge list
    el = []

    # Iterate over people
    people.each do |person|

      # Remove the current
      # person from the possible
      # edges, a person cannot have
      # an edge with themself
      filtered = people - [person]

      # A person can have 0 - 10 edges
      (MIN_EDGES..max_edges)
        .to_a
        .shuffle
        .first
        .times do |i|

          # Random index
          dest_index = rand(0...filtered.length)

          # Push the edge onto the list
          # with the following format
          # [ORIGIN, DESTINATION, WEIGHT]
          el << [
            person,
            filtered[dest_index],
            rand(MIN_WEIGHT..MAX_WEIGHT)
          ]

          # Remove destination person
          filtered.delete_at(dest_index)
      end
    end

    # Return edge list
    el
  end
end


# Run `ruby edge_list.rb` to see
# what the edge list looks like
if __FILE__ == $0
  p EdgeList.new(5)
end





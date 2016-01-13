require_relative "edge_list"

class AdjacencyMatrix

  attr_reader :matrix
  def initialize(edgelist)
    @lookup_table = []
    @matrix = Array.new( edgelist.length ) { Array.new( edgelist.length ) }
    edgelist.each do |edge|
      person1 = edge[0]
      person2 = edge[1]
      weight = edge[2]

      add_to_lookup_table(person1)
      add_to_lookup_table(person2)
      add_to_matrix(person1,person2,weight)
    end
  #loop through edgelist for names
  #create the lookup table(array of names--each name in the index that cooresponds with id)
  #use lookup table
  #loop through the edgelist and put weights in appropriate
  #@lookup_table
  #@matrix(ids,weights)
  end

  def add_to_lookup_table(person)
    if @lookup_table[person.id].nil?
      @lookup_table[person.id] = person.name
    end
  end

  def add_to_matrix(person1,person2,weight)
    @matrix[person1.id][person2.id] = weight
    @matrix[person2.id][person1.id] = weight
  end

  def print_matrix
    print "    "
    @lookup_table.each { |name| print name == nil ? " -- " : " #{name[0..3]} " }
    puts
    @matrix.each_with_index do |row, index1|
      print @lookup_table[index1] == nil ? " -- " : (@lookup_table[index1])[0..3]
      row.each_with_index do |weight, index2|
        str = weight == nil ? "   -   " : "   #{weight}   "
        print str
      end
      puts
    end
  end
end

# Set up the structure
edgelist = EdgeList.new( 4,4 ).list
am = AdjacencyMatrix.new(edgelist)

am.print_matrix

=begin

  1. Create an AdjacencyMatrix class (DONE)
  2. which accepts an EdgeList (DONE)
  3. and converts it to an Adjacency Matrix. Use a very small Edge List to start, e.g. only 3 or 4 names total. Use the "IDs" for your axes since they are unique and start from 0. Only use Arrays and/or Structs!

  # Set up the structure
  el = EdgeList.new( 4 ).list
  am = AdjacencyMatrix.new( el )

  Create a print_matrix method which outputs your Adjacency Matrix as a matrix of names (with an "X" if there is no edge). Don't spend too long making this pretty and note that this will look slightly different from the way you actually store the data in your Adjacency Matrix.
  # Print it out (yours may not be so clean)
  am.print_matrix
          Mike    Joe     Olga     Garrett
  Mike    X       6        4        7
  Joe     6       X        8        1
  Olga    4       8        X        X
  Garrett 7       1        X        X
  Create an edge_weight method which outputs the weight of a given edge:
  # Find the edge (Note that we're passing in the IDs)
  am.edge_weight( 1, 2 )    # Mike (1) and Olga (2)
  #=> 4
  The Adjacency List

  Now you'll create a different structure -- the Adjacency List. It will be similar in spirit but different in implementation. Our goal is for you to get a feel for the differences between them by building the same methods for both.

  Conceptually speaking, our Adjacency List will be an array of linked lists. You might consider the head node to represent the starting vertex and other nodes to represent the ending vertex:

  # An array of head nodes, each of which might
  # or might not link to other nodes if there
  # are more vertices that need to be linked to
  # our head node
  adj_list =
  [ 
    <#Node>,  # -> <#Node> -> <#Node> -> <#Node> -> <#Node>
    <#Node>,  # -> nil
    <#Node>,  # -> <#Node> -> <#Node> -> <#Node>
    <#Node>,  # -> <#Node> -> <#Node>
    <#Node>   # -> <#Node> -> <#Node> -> <#Node> -> <#Node> -> <#Node>
  ]
  Create an AdjacencyList class which accepts an EdgeList and converts it to an Adjacency List. You'll find some definite similarities and differences between this and your Matrix. Use only Arrays and Linked Lists (not Hashes!).
  You may re-use your LinkedList class from the previous assignment

  # Set up the structure
  el = EdgeList.new( 10, 4 ).list
  al = AdjacencyList.new( el )
  Create a print_adj_list method which outputs your Adjacency List as a matrix of names (with an "X" if there is no edge). Don't spend too long making this pretty!
  # Print it out (yours may not be so clean)
  al.print_adj_list
  Mike      Joe(6), Olga(4), Garrett(7)
  Joe       Mike(6), Olga(8), Garrett(1)
  Olga      Mike(4), Joe(8)
  Garrett   Mike(7), Joe(1)
  Build a method edge_weight which allows the user to check what the edge weight is between two IDs (if it exists). What is the Big O of this?
  # Find the edge (Note that we're passing in the IDs)
  al.edge_weight( 1, 2 )    # Mike and Olga
  #=> 4
  Final Thought Questions

  Now that you have some experience building graphs, consider the questions below. Include their answers in your README:

  What are the advantages and disadvantages of using an Adjacency Matrix vs an Adjacency List relative to size and speed of common operations?
  What would the Big O be of inserting a new EDGE to:
  An Edge List?
  An Adjacency Matrix?
  An Adjacency List?
  What would the Big O be of inserting a new VERTEX to:
  An Edge List?
  An Adjacency Matrix?
  An Adjacency List?
  What would the Big O be of REMOVING a vertex or edge from:
  An Edge List?
  An Adjacency Matrix?
  An Adjacency List?
  How would you find all the nodes connected to a particular vertex in:
  An Edge List?
  An Adjacency Matrix?
  An Adjacency List?
  (Optional) Bonus: Graph Statistics

  For both of your graph classes, create a show_stats method which outputs a few key statistics about your graph:

  The total number of nodes and vertices. What is the Big O of this?
  Top 3 "most connected" vertices, meaning those with the highest degree. What is the Big O of this?
  Top 3 "strongest connected" vertices, meaning those where the sum of the edge weights are the highest. Display those weights too. What is the Big O of this?
=end

require_relative '../edge_list'

class AdjacencyMatrix

  attr_reader :edge_list

  def initialize(edge_list)
    @edge_list = edge_list
  end

  def edge_list_to_adjacency_matrix(edge_list)
    nil
  end
end
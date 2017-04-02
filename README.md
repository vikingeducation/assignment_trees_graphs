# assignment_graphs_trees
Rise over run.

Andrea A

[A Data Structures and Algorithms Ruby Assignment from the Viking Code School using Trees and Graphs](http://www.vikingcodeschool.com)

# Run the Adjacency matrix
If running from pry:

load 'adjacency_matrix.rb'
am = AdjacencyMatrix.new

load 'adjacency_list.rb'
al = AdjacencyList.new

# What are the advantages and disadvantages of using an Adjacency Matrix vs an Adjacency List relative to size and speed of common operations?
An adjacency matrix uses O(n*n) memory. It has fast lookups to check for presence or absence of a specific edge, but slow to iterate over all edges.

Adjacency lists use memory in proportion to the number edges, which might save a lot of memory if the adjacency matrix is sparse. It is fast to iterate over all edges, but finding the presence or absence specific edge is slightly slower than with the matrix.


# What would the Big O be of inserting a new EDGE to:
An Edge List? O(1)
An Adjacency Matrix? O(1) if array builts
An Adjacency List? O(1)

# What would the Big O be of inserting a new VERTEX to:
An Edge List? O(1)
An Adjacency Matrix? O(n*n) -Now, if there is to add a new vertex, one has to increase the storage for a |V|² matrix to (|V|+1)². That means you will have to copy the whole content of the former smaller matrix to the newly allocated memory for the bigger matrix, because the mapping won't fit anymore. And that is obviously an O(|V|²) operation.

An Adjacency List? O(1)


# What would the Big O be of REMOVING a vertex or edge from:
An Edge List?
An Adjacency Matrix?
An Adjacency List?
How would you find all the nodes connected to a particular vertex in:
An Edge List?
An Adjacency Matrix?
An Adjacency List?
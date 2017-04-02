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

An Adjacency Matrix? O(1) if array built

An Adjacency List? O(1)

# What would the Big O be of inserting a new VERTEX to:

An Edge List? O(1)

An Adjacency Matrix? O(n*n) -Now, if there is to add a new vertex, one has to increase the storage for a |V|² matrix to (|V|+1)². That means you will have to copy the whole content of the former smaller matrix to the newly allocated memory for the bigger matrix, because the mapping won't fit anymore. And that is obviously an O(|V|²) operation.

An Adjacency List? O(1)

# What would the Big O be of REMOVING a vertex or edge from:
An Edge List?
O(1) - You will need to recreate the flat list in order with the edge/vertexes removed

An Adjacency Matrix? O(n*n)
Removing a vertex because this affects the structure of the array  
O(1) if removing an edge since this is a matter of updating a value in the 2D array


An Adjacency List? O(n)
Once you have identified the vertex that needs to be removed, you now need to remove all the edges of that vertex. Since you are using an adjacency List, you simply need to iterate over the edge-list of the vertex you found in the previous step and update all those nodes. 
Hence the run-time of removeVertex will only beO(|V| + |E|).
Remove edge = O(|E|)

# How would you find all the nodes connected to a particular vertex in:

An Edge List? O(n)
Iterate through the list and print out all the nodes for a given vertex, store as you go along as they could be in either the to or from vertex


An Adjacency Matrix? 0(n)
Iterate through the row and column for the given vertex id 

An Adjacency List? O(|V|)
Locate the given linked list in the array using index based on the vertex and go through each item in the linked list



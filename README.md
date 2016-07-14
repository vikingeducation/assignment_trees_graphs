# assignment_graphs_trees
Rise over run.

[A Data Structures and Algorithms Ruby Assignment from the Viking Code School using Trees and Graphs](http://www.vikingcodeschool.com)

Authors: DavidJ and Vishal.

What are the advantages and disadvantages of using an Adjacency Matrix vs an Adjacency List relative to size and speed of common operations?

Adjacency List
Pros: Takes less memory

Cons: Finding edge could be O(V)

Adjacency Matrix
Pros: Fast O(1) insertion/deletion of edge

Cons: Takes up a lot of memory O(V^2)

What would the Big O be of inserting a new EDGE to:
An Edge List? O(1)
An Adjacency Matrix? O(1)
An Adjacency List? O(V)

What would the Big O be of inserting a new VERTEX to:
An Edge List? O(V)
An Adjacency Matrix? O(V)
An Adjacency List? O(V)

What would the Big O be of REMOVING a vertex or edge from:
An Edge List? O(E)
An Adjacency Matrix? O(V)
An Adjacency List? O(1) for a vertex, O(V) for an edge

How would you find all the nodes connected to a particular vertex in:
An Edge List? Traverse the edge list and keep count
An Adjacency Matrix? Traverse all the cells in a particular row
An Adjacency List? Traverse all the nodes in the linked list corresponding to that vertex
# assignment_graphs_trees
Rise over run.

[A Data Structures and Algorithms Ruby Assignment from the Viking Code School using Trees and Graphs](http://www.vikingcodeschool.com)


Joe Bernardi

What are the advantages and disadvantages of using an Adjacency Matrix vs an Adjacency List relative to size and speed of common operations?

Advantage of matrices is search functions can be done in constant time, but the disadvantage is every element must be checked, even the empty ones.

Advantage of lists is locating the list is based on index and therefore very quick. Plus the empty cells are eliminated in the approach upon creation. The disadvantage is it still would have to iterate through every item in the list.


What would the Big O be of inserting a new EDGE to:
An Edge List? O(1)
An Adjacency Matrix? O(1)
An Adjacency List? O(1)

What would the Big O be of inserting a new VERTEX to:
An Edge List? O(1)
An Adjacency Matrix? O(n)
An Adjacency List? O(1)

What would the Big O be of REMOVING a vertex or edge from:
An Edge List? O(n)
An Adjacency Matrix? O(1)
An Adjacency List? O(1)

How would you find all the nodes connected to a particular vertex in:
An Edge List? Iterate through all vertices with reference to specific vertex
An Adjacency Matrix? find all edges for specific ID or Vertex
An Adjacency List? jump to desired node and iterate through the linked list
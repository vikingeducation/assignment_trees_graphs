Dylan and Phil
# assignment_graphs_trees
Rise over run.

[A Data Structures and Algorithms Ruby Assignment from the Viking Code School using Trees and Graphs](http://www.vikingcodeschool.com)


What are the advantages and disadvantages of using an Adjacency Matrix vs an Adjacency List relative to size and speed of common operations?
A matrix wastes a lot of memory if there is not a lot of data, whereas a list is efficient with memory. A matrix has faster lookup than a list, because there's no need to traverse a linked list. When most of the data points are full, a matrix is faster and just as efficient with memory; when is not a lot of data, a linked list is fast and uses a lot less memory than a matrix.

What would the Big O be of inserting a new EDGE to:
An Edge List? O(n) because we need to copy the entire array to add a new element.
An Adjacency Matrix? O(1)
An Adjacency List? O(n)

What would the Big O be of inserting a new VERTEX to:
An Edge List? O(n) because it isn't recorded until there is an edge
An Adjacency Matrix? O(n)
An Adjacency List? O(n)

What would the Big O be of REMOVING a vertex or edge from:
An Edge List? O(n)
An Adjacency Matrix? O(n)
An Adjacency List? O(n)

How would you find all the nodes connected to a particular vertex in:
An Edge List? O(n)
An Adjacency Matrix? O(n)
An Adjacency List? O(1) if keeping track of length, but O(n) to calculate the number dynamically

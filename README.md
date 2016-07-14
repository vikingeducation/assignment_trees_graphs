Johnny Steenbergen & Alex Lach
# assignment_graphs_trees
Rise over run.

[A Data Structures and Algorithms Ruby Assignment from the Viking Code School using Trees and Graphs](http://www.vikingcodeschool.com)


What are the advantages and disadvantages of using an Adjacency Matrix vs an Adjacency List relative to size and speed of common operations? Adjacency matrix has constant time for looking whether two vertices share an edge. The disadvantage is that it has wasted space. 

Advantages of an adjacency list is the space that is saved and somewhat fast search times.


What would the Big O be of inserting a new EDGE to:
An Edge List? n, because you have go through and make sure you're grouping vertices together
An Adjacency Matrix? constant
An Adjacency List? constant

What would the Big O be of inserting a new VERTEX to:
An Edge List? n, because you have to add every new combination to a new array
An Adjacency Matrix? 2n, because you need it add it to both arrays
An Adjacency List? n, because you need to rebuild the array that holds the linked lists

What would the Big O be of REMOVING a vertex or edge from:
An Edge List? n, because you have to check every edge to see if the removed vertex is included
An Adjacency Matrix? 2n, because you need to create two new arrays 
An Adjacency List? n, because you need to rebuild the array

How would you find all the nodes connected to a particular vertex in:
An Edge List? Go through whole list and see which nodes the vertex is connected to
An Adjacency Matrix? Go through vertex's whole list of destination nodes and see which are connected
An Adjacency List? Go through vertex's linked list
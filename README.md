# assignment_graphs_trees
Rise over run.

[A Data Structures and Algorithms Ruby Assignment from the Viking Code School using Trees and Graphs](http://www.vikingcodeschool.com)

by Sia Karamalegos

## Graph Data Questions

1. What are the advantages and disadvantages of using an Adjacency Matrix vs an Adjacency List relative to size and speed of common operations?
Answer: An adjacency matrix is very fast for basic read operations but requires a lot of excess space. An adjacency list requires less space but compromises a bit on speed.

2. What would the Big O be of inserting a new EDGE to:
An Edge List? O(n) since it's essentially like adding an element to an array
An Adjacency Matrix? O(1) since the array already exists, and we are just updating one value
An Adjacency List? O(1) since it's adding a node to the end of a linked list

3. What would the Big O be of inserting a new VERTEX to:
An Edge List? O(n) since it's still adding an element to an array (assuming we are also adding an edge for that vertex)
An Adjacency Matrix? O(n^2) since we have to create a completely new 2-D array
An Adjacency List? O(n) since we are adding an element to the list array

4. What would the Big O be of REMOVING a vertex or edge from:
An Edge List? O(n) but potentially worse for removing a vertex because we would have to find all instances of that vertex and remove them
An Adjacency Matrix? For an edge, O(1), but for a vertex, O(n^2).
An Adjacency List? For a vertex, O(n), and for an edge, O(n) since we have to traverse the list to find the new "last"

5. How would you find all the nodes connected to a particular vertex and would would be its Big O for:
An Edge List? Select all pairs that contain that vertex, O(n)
An Adjacency Matrix? Select the row for that vertex, then get the indices for all non-nil values, O(n)
An Adjacency List? Select the index for that vertex, then crawl the linked list for all the edges, O(n)
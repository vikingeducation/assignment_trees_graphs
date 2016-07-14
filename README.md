# assignment_graphs_trees
Rise over run.

[A Data Structures and Algorithms Ruby Assignment from the Viking Code School using Trees and Graphs](http://www.vikingcodeschool.com)

jessica dennis
Chris Goodson

1. Adjacency matrix takes up more space because empty values are stored, so the matrix can be very large relative to the amount of data stored.
Adjacency matrix has O constant time, while the list has big O of one. This is because you have to crawl through the items in the list to get to the search item.

2. Big O of inserting edge into:
 - edge list: constant (just add it, assuming space in array)
 - adjacency matrix: constant (depends if it's a direct graph)
 - adjacency list: n ()

 3. Big O of inserting vertex to:
  - edge list:
  - adjacency matrix: n squared
  - adjacency list: n


What would the Big O be of REMOVING a vertex or edge from:
An Edge List? n
An Adjacency Matrix? edge (constant), vertex( n squared)
An Adjacency List? edge (n), vertex(n)

How would you find all the nodes connected to a particular vertex in:
An Edge List? Iterate through the edge list checking for link
An Adjacency Matrix? Read row for that vertex
An Adjacency List? crawl linked list for that particular vertex
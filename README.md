a sequoia by Matt and Graham

# assignment_graphs_trees
Rise over run.

[A Data Structures and Algorithms Ruby Assignment from the Viking Code School using Trees and Graphs](http://www.vikingcodeschool.com)

1. What are the advantages and disadvantages of using an Adjacency Matrix vs an Adjacency List relative to size and speed of common operations?
  - Matrix has larger memory footprint, but random access is quick O(1).
  - List has smaller footprint and slower access O(n).

2. What would the Big O be of inserting a new EDGE to:
  A. An Edge List?
    O(n)
  B. An Adjacency Matrix?
    O(1)
  C. An Adjacency List?
    O(n)

3. What would the Big O be of inserting a new VERTEX to:
  A. An Edge List?
    O(n)
  B. An Adjacency Matrix?
    O(v^2)
  C. An Adjacency List?
    O(1)

4. What would the Big O be of REMOVING a vertex or edge from:
  A. An Edge List?
    O(n)
  B. An Adjacency Matrix?
    O(n)
  C. An Adjacency List?
    O(1)

5. How would you find all the nodes connected to a particular vertex in:
  A. An Edge List?
    Iterate through list looking for the correct vertex and print all edges connected to that vertex
  B. An Adjacency Matrix?
    Find that vertex's row and print all other vertex's in that row.
  C. An Adjacency List?
    Find that vertex in adj_list and print all nodes connected to that vertex

# assignment_graphs_trees
Rise over run.

## Efraim

[A Data Structures and Algorithms Ruby Assignment from the Viking Code School using Trees and Graphs](http://www.vikingcodeschool.com)

1. What are the advantages and disadvantages of using an Adjacency Matrix vs
an Adjacency List relative to size and speed of common operations?

The Adjacency Matrix allows for fast access, but its memory expensive.

Adjacency Lists, balances well both points.

2. What would the Big O be of inserting a new EDGE to:
  + An Edge List?

  O(1), if the array doesn't need to be recreated.

  + An Adjacency Matrix?

  O(1), since it's just the creation of a new row.

  + An Adjacency List?

  O(2), because it's a matter of finding the row and creating a new node.

3. What would the Big O be of inserting a new VERTEX to:

  Same as before.

  + An Edge List?
  + An Adjacency Matrix?
  + An Adjacency List?

4. What would the Big O be of REMOVING a vertex or edge from:

  + An Edge List?

  O(n), because you would have to traverse the items to find it first.

  + An Adjacency Matrix?

  O(1): find the row and the cell.

  + An Adjacency List?

  O(d), find the row and traverse the list until you find it.

5. How would you find all the nodes connected to a particular vertex in:

  + An Edge List?

  You'd have to loop through all nodes, filtering for the target.

  + An Adjacency Matrix?

  You simply fetch it's row.

  + An Adjacency List?

  Same as before.

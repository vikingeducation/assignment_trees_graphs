# assignment_graphs_trees
Rise over run.

[A Data Structures and Algorithms Ruby Assignment from the Viking Code School using Trees and Graphs](http://www.vikingcodeschool.com)
Ann Allan

1)  An adjacency matrix is fast to locate a give edge but can take longer to calculate all of the edges in a given row.  An adjacency list is quick to locate the list of edges for each node and only has to iterate through the linked list to the correct position to find a specific edge.  It only requires twice the number of vertices in terms of space.

2)   Edge List - O(V)
      Adjacency Matrix - O(1)
      Adjacency List - O(1)

3)   Edge List - O(V)
      Adjacency Matrix - O(V^n)
      Adjacency List - O(V)

4)   Edge List - O(E)
      Adjacency Matrix - O(V^n)
      Adjacency List - O(V+E)

5)   Edge List - iterate through the 'to' vertices
      Adjacency Matrix - iterate through the vertex row for cells that are not nil
      Adjacency List - iterate through the linked list for the node

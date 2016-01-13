# assignment_graphs_trees
Rise over run.

[A Data Structures and Algorithms Ruby Assignment from the Viking Code School using Trees and Graphs](http://www.vikingcodeschool.com)

Andrew and Kesley.

1. What are the advantages and disadvantages of using an Adjacency Matrix vs an Adjacency List relative to size and speed of common operations?

The insertion and deletion operations in the adjacency list is quite fast as it mimics the data structure of a hash table. Finding elements could be slower depending on the size of the linked lists, whereas lookup is pretty much instant in an adjacency matrix because it's simply a 2D array.

2. What would the Big O be of inserting a new EDGE to:

  1. An Edge List?

    O(E), because adding an element to the end of an array requires creation of a new array (which is bigger), and the elements need to be copied over.

  2. An Adjacency Matrix?

    O(1), since we are assuming that the insertion and deletion operations depend on the array lookup operation, it's O(1) simply because it's assumed that the array lookup is defined (we already know what vertices we are connecting).


  3. An Adjacency List?

    O(1) because adding elements to the end of a linked list doesn't depend on the length of list.

3. What would the Big O be of inserting a new VERTEX to:

  1. An Edge List?

    O(1), because adding a new vertex doesn't the edge list.

  2. An Adjacency Matrix?

    O(V^2), because the whole matrix has to rebuilt with an additional row and column, and each of these operations depend on how many elements already exist.

  3. An Adjacency List?

    O(V), because the array has to be modified to account for the new vertex, while the linked lists are not touched.

4. What would the Big O be of REMOVING a vertex or edge from:

  1. An Edge List?

    O(E), because you are rebuilding the array.

  2. An Adjacency Matrix?

    O(1), (removing edges) removing entries (assuming you know where to look) is instant because array lookup is instant.

    O(V^2), (removing a vertex) because the 2D array has to be rebuilt with new dimensions.

  3. An Adjacency List?

    O(V), (removing a vertex) because the array has to be rebuilt with new dimensions.

    O(E), (removing an edge) because traversing a linked-list to actually remove it from the list is dependent on how many edges exist.

5. How would you find all the nodes connected to a particular vertex in:

  1. An Edge List?

    Traverse the array and record all other vertices that match the first index.

  2. An Adjacency Matrix?

    Traverse the appropriate row and record all indices with values.

  3. An Adjacency List?

    Traverse the appropriate linked-list, and record all nodes.

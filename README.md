# assignment_graphs_trees
Rise over run.

[A Data Structures and Algorithms Ruby Assignment from the Viking Code School using Trees and Graphs](http://www.vikingcodeschool.com)

1. What are the advantages and disadvantages of using an Adjacency Matrix vs an Adjacency List relative to size and speed of common operations?
Adjacency Matrix is faster for lookup edge weights. Adjacency List might be slower, if the degree is more i.e. number of edges going out of a vertex.
But, Adjacency List is very efficient is space usage, when the size is huge. Whereas, adjacency matrix, waste a lot of memory by allocating memory for edges which are not present.


2. What would the Big O be of inserting a new EDGE to:
An Edge List?        - O(1)
An Adjacency Matrix? - O(1)
An Adjacency List?   - O(n) #where n is edges/vertex

3. What would the Big O be of inserting a new VERTEX to:
An Edge List?        - O(1)
An Adjacency Matrix? - O(1) #Assuming, we dont consider dynamic array properties
An Adjacency List?   - O(1) #Assuming, we dont consider dynamic array properties

4. What would the Big O be of REMOVING a vertex or edge from:
An Edge List?        - O(1)
An Adjacency Matrix? - O(E) #E is edges out of that vertex
An Adjacency List?   - O(E) #E is edges out of that vertex

5. How would you find all the nodes connected to a particular vertex in:
An Edge List?        - Iterate all edges
An Adjacency Matrix? - Iterate edges originating from particular vertex (Array)
An Adjacency List?   - Iterate edges originative from particular vertex (linkedList)
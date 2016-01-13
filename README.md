# assignment_graphs_trees
Rise over run.

[A Data Structures and Algorithms Ruby Assignment from the Viking Code School using Trees and Graphs](http://www.vikingcodeschool.com)

Julia, Kit, and Ellen

1. What are the advantages and disadvantages of using an Adjacency Matrix vs an Adjacency List relative to size and speed of common operations?

Adjacency Matrix is bigger in size and therefore takes more memory than an Adjacency List.  

We can find information faster in an Adjacency Matrix because we can just search by coordinates.  

Adjacency Matrix can be used to find specific edges and an Adjacency List can be used to find many edges.   

2. What would the Big O be of inserting a new EDGE to:  
**An Edge List?** O(n)  
**An Adjacency Matrix?** O(n)  
**An Adjacency List?** O(1)  

3. What would the Big O be of inserting a new VERTEX to:  
**An Edge List?**  O(n)  
**An Adjacency Matrix?** O(n)  
**An Adjacency List?** O(n) 

4. What would the Big O be of REMOVING a vertex or edge from:  
**An Edge List?** O(n)  
**An Adjacency Matrix?** O(n)  
**An Adjacency List?** O(1)

5. How would you find all the nodes connected to a particular vertex in:  
An Edge List?  Iterate through the edge list finding all edges that are connected to your vertex  
An Adjacency Matrix? Iterate through both from and to columns  
An Adjacency List? Iterate through to find the vertex 
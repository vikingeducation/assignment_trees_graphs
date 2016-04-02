# assignment_graphs_trees
Rise over run.

[A Data Structures and Algorithms Ruby Assignment from the Viking Code School using Trees and Graphs](http://www.vikingcodeschool.com)

Jeremy Vermast

What are the advantages and disadvantages of using an Adjacency Matrix vs an Adjacency List relative to size and speed of common operations?
 - Adjacency Matrix Size is bigger than Adjacency List, because even no edges is save in data structure.
 - Reading speed is faster O(1) : two operations
 - Reading all the edges is slower O(n) : need to read the empty cells too

What would the Big O be of inserting a new EDGE to:
An Edge List? 		 O(1) if unsorted / O(n) is sorted
An Adjacency Matrix? O(1) 2 operations, constant time
An Adjacency List?   O(1) if unsorted, O(d) d is the number of degrees if sorted


What would the Big O be of inserting a new VERTEX to:
An Edge List? 		 O(1) or O(n) if sorting insert
An Adjacency Matrix? O(1)
An Adjacency List?   O(1)


What would the Big O be of REMOVING a vertex or edge from:
An Edge List?		 O(n)
An Adjacency Matrix? O(n) for vertex, O(1) for edge
An Adjacency List?	 O(n) for vertex, O(1) for edge


How would you find all the nodes connected to a particular vertex in:
An Edge List?		 have to loop through all the array if unsorted O(n)
An Adjacency Matrix? loop through the array at one index O(n)
An Adjacency List?	 go through all the nodes at one index O(d)
# assignment_graphs_trees
Rise over run.

[A Data Structures and Algorithms Ruby Assignment from the Viking Code School using Trees and Graphs](http://www.vikingcodeschool.com)

Justin Mullis' fork

### What are the advantages and disadvantages of using an Adjacency Matrix vs an Adjacency List relative to size and speed of common operations?
The matrix is Ruby arrays for everything instead of just the initial lookup.  So reads are pretty simple and always just two steps, index the "from" main array and then index into the "to" array you've selected.  The matrix does take up more space than needed showing all the non-existent edges.  Adding additional vertices would require a complete rebuild of the matrix as its written.

The Adjacency List is less memory intensive, storing on what is needed, but due to using linked lists has a higher Big O for most functions

### What would the Big O be of inserting a new EDGE to:
1. An Edge List?
Constant time, we just need to add an item onto the end of the list
2. An Adjacency Matrix?
Constant time, always just two indexes away from the data that needs updating
3. An Adjacency List?
Linear time, will grow as the linked lists grow

### What would the Big O be of inserting a new VERTEX to:
1. An Edge List?
Constant time, still just adding another item to the list
2. An Adjacency Matrix?
As written here the entire matrix would need to be recreated, it could be optimized from this to constant time by adding a function, you would just be adding onto two arrays
3. An Adjacency List?
Constant time, we just need to add a new Linked list to our main array

### What would the Big O be of REMOVING a vertex or edge from:
1. An Edge List?
Linear time, we need to check through and potentially update every element in the list
2. An Adjacency Matrix?
Removing an EDGE is constant time, removing a VERTEX is linear as we need to check the entire matrix for references 
3. An Adjacency List?
Removing either is linear time

### How would you find all the nodes connected to a particular vertex and would would be its Big O for:
1. An Edge List?
Enumerate the entire list.  Linear time.
2. An Adjacency Matrix?
Both the entire row and column for the vertex need to be checked, linear time
3. An Adjacency List?
Linear time, the entire data set needs to be checked.


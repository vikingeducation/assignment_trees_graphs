# assignment_graphs_trees
Rise over run.

[A Data Structures and Algorithms Ruby Assignment from the Viking Code School using Trees and Graphs](http://www.vikingcodeschool.com)

Worked on by [Roy Chen](https://github.com/roychen25)

## Final Thought Questions

### What are the advantages and disadvantages of using an Adjacency Matrix vs an Adjacency List relative to size and speed of common operations?

#### Adjacency Matrix

##### Time complexity
*Create/Insert:* Assuming we're using Ruby Arrays (which can dynamically resize), then O(1), since we don't have to re-create the array. If we're using static, fixed-size arrays, then O(n).

*Read:* O(1). We can access the edge at the specified index in constant time.

*Update:* O(1). Similar to read, we can access the edge at the specified index and update it in constant time.

*Delete:* O(1) / O(n), for the same reasons as Create/Insert.

##### Space complexity
O(n^2). We need to create a 2-dimensional array and populate non-existent edges with nil values.

##### Adjacency List

###### Time complexity

*Create/Insert:* O(1). We simply access the source vertex's linked list in the array in constant time, then either create a new linked list, or append a new edge to the end of the list.

*Read:* O(n). We may need to traverse the whole linked list in the worst case.

*Update:* O(n). Similar to reading, we may need to traverse the whole linked list to find the entry we want to update.

*Delete*: O(n). Again, we may need to traverse the whole linked list to find the entry we want to delete.

###### Space complexity
O(n). We only create nodes (consisting of destination vertex / edge weight) as required.


### What would the Big O be of inserting a new EDGE to:
#### An Edge List?
O(1). Just append the new edge to the end of the edge list.

#### An Adjacency Matrix?
O(n^2). If we had an empty matrix, and then decided we had an edge between source vertex with ID 0, and destination vertex with ID 20, we'd need to create a 20 by 20 array (n^2) and populate it with nil values, then set the weight for that particular edge.

#### An Adjacency List?
O(1). Find the linked list for the source vertex, then add the new edge to the end of the linked list.


### What would the Big O be of inserting a new VERTEX to:
#### An Edge List?
O(1). Append the new vertex to the end of the edge list (indicating it has no edges).

#### An Adjacency Matrix?
O(n). We need to create a new array for this vertex, and populate it with n instances of nil.

#### An Adjacency List?
O(1), assuming we're using Ruby Arrays, so we don't have to resize the array when appending a new entry to the end. O(n) if we're using static, fixed-size arrays, as we'll have to re-create the array.


### What would the Big O be of REMOVING a vertex or edge from:
#### An Edge List?
O(n). We may need to iterate through the whole edge list to find the vertex/edge we want to remove.

#### An Adjacency Matrix?
O(1). We can simply set the edge to nil, or set the entire array representing the source vertex (and its edges) to nil.

#### An Adjacency List?
O(1) to remove the entire vertex, O(n) to remove a particular edge.


### How would you find all the nodes connected to a particular vertex in:
#### An Edge List?
1. Note the source vertex
2. Iterate through the edge list
3. For each edge, if the source vertex for that edge matches the source vertex we noted, store the destination vertex in an array
4. Return the array

#### An Adjacency Matrix?
1. Note the source vertex
2. Access the appropriate row in the matrix
3. For each element in the row, if there's an edge weight, note the column number, that is our destination vertex
4. Store the destination vertex in an array
5. Return the array

#### An Adjacency List?
1. Note the source vertex
2. Access the appropriate linked list in the adjacency list
3. Iterate through all nodes of the linked list, storing the destination vertex of each node in an array
4. Return the array

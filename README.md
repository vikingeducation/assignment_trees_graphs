# assignment_graphs_trees
Rise over run.

```
    B
   / \
  I   D
 /     \
E       O
  \   /
    W
   / \
  E   G
   \ /
    O
```

1. What are the advantages and disadvantages of using an Adjacency Matrix vs an Adjacency List relative to size and speed of common operations?

	Adjacency Matrix

	Adjacency matrices have a fast lookup time when locating a given edge (assuming you have both the x and y indexes). The lookup can be done in O(1) because random array index accessing can be done in constant time. 

	However, an adjacency matrix can potentially waste lots of emtpy space. It requires that an array index exist regardless of whether it holds data. It also requires a full traversal of an array to retrieve all of the edges for a given index. The problem with this is that there may be many indexes that could potentially be empty that must be read anyway.

	An adjacency matrix would be fairly efficient for small graphs, but slow for large ones. Also unrealistic to store for very large graphs.

	Adjacency List

	The advantage to an adjacency list is that it reduces an adjacency matrix to only the necessary data. It removes the empty array indexes. Instead it uses linked lists in each array index. So instead of a 2d array, there is an array of linked lists. This allows for O(1) lookup for the first index of the edge and then traversal of the edges that are connected. This is O(n) where n is the degree of the vertex.

	The advantage is less space is used to store the data. The disadvantage is that if the degrees of the vertices are long enough, traversal will take O(n) instead of O(1).

1. What would the Big O be of inserting a new EDGE to:
	1. An Edge List?

		Since an edge list is an array, adding to it in anyway requires reconstruction. This means traversal which results in O(n).

	1. An Adjacency Matrix?

		Inserting an edge to an adjacency matrix can be achieved in O(1). This is because all of the indexes for an edge to be inserted to already exist. Index into the array and set the value.

	1. An Adjacency List?

		Inserting an edge into an adjacency list can be slower if the insertion must take place in the middle or at the end of the linked list. This would be O(n) where n is the degree of the vertex. However, travsersal is not necessary for insertion. Prepending a linked list can be done in O(1). Thus, as long as the linked list is prepended to, the operation can be performed in O(1).

1. What would the Big O be of inserting a new VERTEX to:

	1. An Edge List?

		An edge list is a list of only the connections between vertices. Unless the vertex has edges, this operation would not even need to be performed. However, if the vertex had edges, the operation would take O(n).

	1. An Adjacency Matrix?

		Due to the adjacency matrix storing an array index for every edge regardless if the edge is null, this operation would take O(n^2). The reason is an entirely new adjacency matrix would need to be constructed, and the matrix consists of n^2 indexes. No matter if the new vertex has edges with existing vertices, each and every array would need to be rebuilt to hold null indexes for the new vertex.

	1. An Adjacency List?

		The time complexity for adding a vertex to an adjacency list is O(n). The array that holds all of the linked lists must have an index added to it to represent the new vertex. This automatically means O(n).

1. What would the Big O be of REMOVING a vertex or edge from:

	1. An Edge List?

		- Removing a vertex:

			Assuming the vertex has edges, the time complexity would be O(n). However, if there are no entries, nothing would be removed. So if it were possible to know if a vertex has edges without traversing the list, it could be removed in O(1). If traversal is required to determine if the vertex has edges, then the result is O(n).

		- Removing an edge:

			Removing an edge from an edge list would require traversal, resulting in O(n). This is because an edge list is an array. A gap cannot be left in an array, so the array must be rebuilt. Rebuilding the array without the gap means iterating over all indexes except the gap. This is O(n).

	1. An Adjacency Matrix?

		- Removing a vertex:

			Removing a vertex would result in the same time complexity as adding one. The entire adjacency matrix would need to be reconstructed. This is O(n^2).

		- Removing an edge:

			Removing an edge is fast in an adjacency matrix. Simply index into the array and set to null. This can be done in O(1).

	1. An Adjacency List?

		- Removing a vertex:

			Removing a vertex from an adjacency list would require traversal of the array and all of it's child linked lists. This is because it is not enough to simply remove the index of the parent array. The references to the vertex in the edges of the linked lists of all the other vertices must be removed as well. This results in O(n) with added complexity of traversing each child linked list.

		- Removing an edge:

			Removing a single edge can be done fairly quickly in a adjacency list provided the linked lists are not too long. However, because the adjacency list stores 2 references to the edge both must be removed. The result is O(n), however it can potentially be doubled if the linked lists contain many edges.

1. How would you find all the nodes connected to a particular vertex and would would be its Big O for:

	1. An Edge List?

		This would require traversal of the edge list, which is an array. The result is O(n). However, there is room for faster time complexity. It is possible that the edge list is sorted and that the vertix is the first index. So it could be that all of the edges of the vertex are the first indexes of the array. However unlikely, depending on the sort and size of the edge list the time complexity could be better. Though the worst case, which is what Big O means, is O(n).

		It should also be noted that finding all of the connected nodes in an edge list is highly inefficient. This is because it requires traversal of vertices that are not the one in question.

	1. An Adjacency Matrix?

		The adjacency matrix improves the efficiency of this operation greatly over the edge list. This is because it allows indexing into an array which is O(1) and then simply traversing that array to find all of the edges. This results in O(n).

		The problem with this is there is a likelyhood of traversing empty data. This is because the adjacency matrix requires an index for a null edge.

	1. An Adjacency List?

		The adjacency list shows that it was architected for this operation. Indexing into it's array can be done in constant time. Then the nodes of the linked list must be traversed. However, unlike an adjacency matrix, there are only existing edges in the linked list. This improves the time complexity over the adjacency matrix even though technically the Big O is still O(n), this is a case where the meaning of n matters a lot. Here we are only traversing meaningful data, which is likely to take less time.

[A Data Structures and Algorithms Ruby Assignment from the Viking Code School using Trees and Graphs](http://www.vikingcodeschool.com)

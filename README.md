# assignment_graphs_trees
Rise over run.

Author : Behdad Analui

[A Data Structures and Algorithms Ruby Assignment from the Viking Code School using Trees and Graphs](http://www.vikingcodeschool.com)

What are the advantages and disadvantages of using an Adjacency Matrix vs an Adjacency List relative to size and speed of common operations?

	The matrix will waste more space while ideally for the adj list we have ONLY space required for edges available, for matrix we have a sparse array with lots of unused space
	As for the speed, finding a wight of an edge is always O(1) in matrix because it's always a simple matrix lookup
	But fot the list we have O(1)*O(d), O(1) to look up and find the corresponding linked list and then traversing through it
	For adding/removing/modifying an edge, it's the same as above
	Going through the whole graph (like printing) it's almost the same for both as we have to traverse the entire edges (with upper bound being O(n^2) or O(m) where m is number of edges)

What would the Big O be of inserting a new EDGE to:

	An Edge List?

		O(1) if adding to the end of array and no need for array reconstruction, O(n^2) or O(m) otherwise if we have to reconstruct

	An Adjacency Matrix?

		O(1) since it's a matter of matrix look up and no reconstruction

	An Adjacency List?

		O(1)*O(d), O(1) to look up and find the corresponding linked list and then traversing through it

What would the Big O be of inserting a new VERTEX to:

	An Edge List?

		O(1) if adding to the end of array and no need for array reconstruction, O(n^2) or O(m) otherwise if we have to reconstruct

	An Adjacency Matrix?

		O(n^2) or O(m) since we have to reconstruct the array

	An Adjacency List?

		O(1) if adding to the end of adj list array and O(n) if we have to reconstruct


What would the Big O be of REMOVING a vertex or edge from:

	An Edge List?

		O(m) or O(n^2) as we have to go through all edges 

	An Adjacency Matrix?

		O(n^2) to remove a vertex as we have to reconstruct the matrix and O(1) if removing an edge

	An Adjacency List?

		O(1)*O(d) to remove an edge as we have to find the corresponding list first and then traverse through, O(1) to remove a vertex if we don't need to reconstrcut but O(n) if we have to reconstrcut(most likely)


How would you find all the nodes connected to a particular vertex in:

	An Edge List?

		O(m) or O(n^2) as we have to traverse through the list

	An Adjacency Matrix?

		O(n)*O(1) just look up the line corresponding the node and then traverse through it

	An Adjacency List?

		O(n)*O(1) just look up the line corresponding the node and then traverse through it

1. **What are the advantages and disadvantages of using an Adjacency Matrix vs an Adjacency List relative to size and speed of common operations?**  
Adjacency matrices allow you to access and update data very quickly, in O(1) constant time. However, they take up O(n^2) space.
Adjacency lists are very efficient when it comes to space, but they have an access time of O(d), where d is the degree (number of edges connected to a vertex). Insertion is also very fast, at O(1), if duplication is not an issue. 

2. **What would the Big O be of inserting a new EDGE to:**
	3. **An Edge List?**  
O(n) linear time, where n is the total number of elements
	4. **An Adjacency Matrix?**  
	O(1) constant time if array has been built 
	5. **An Adjacency List?**  
	O(n+d) where `n` is the number of vertices in the list and `d` is the degree of each vertex.  

3. **What would the Big O be of inserting a new VERTEX to:**
	1. **An Edge List?**  
	O(n) linear time. This is adding a new row into the array
	2. **An Adjacency Matrix?**  
	O(n^2) polynomial time since the entire array would need to be rebuilt to accommodate the new cell
	3. **An Adjacency List?**
O(n), since it's just a matter of adding a new row to an array

4. **What would the Big O be of REMOVING a vertex or edge from:**
	5. **An Edge List?**  
O(n), since the array would need to be rebuilt
	6. **An Adjacency Matrix?**  
O(n^2) if removing a vertex since this affects the structure of the array  
O(1) if removing an edge since this is a matter of updating a value in a 2D array
	7. **An Adjacency List?**  
O(n*d) if removing all references to a vertex from the entire adjacency list  
O(d) if removing an edge 
10. **How would you find all the nodes connected to a particular vertex in:**  
	11. **An Edge List?**  
	Create a temporary array. Check the 'to' and 'from' columns for references to the particular vertex. If a reference exists, add that node to the array and return it.
	12. **An Adjacency Matrix?**    
	Iterate through the vertex's row and use the column number to get the id of each node 
	13. **An Adjacency List?**  
	Access the vertex's linked list and traverse it
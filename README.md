#  Data Structures in Ruby and searching algorithms

practice with representing data using Trees and Graphs.

* binary_tree.rb - My recreation of Binary Search Tree as a highly structured way of storing comparative data which optimizes it for future searching. BST is built out of a simple array of data and then displayed to the screen in the form of nodes.
* edge_list.rb - the edge list which is used by adjecency_matrix and adjecency_list
* adjecency_matrix.rb - prints a table listing all the possible connections and weights between two vertices of the edge_list
* adjecency_list.rb - prints An array of head nodes, each of which might or might not link to other nodes if there are more vertices that need to be linked to our head node


## Getting Started

If you want to quick run some the examples to see the code in action, run
```
$ ruby example.rb
```
from the project directory.

## Authors

* **Dariusz Biskupski** - *Initial work* - https://dariuszbiskupski.com


## Acknowledgments

It is part of the assignment created for [Viking Code School](https://www.vikingcodeschool.com/)



## Appendix - My Thoughts on Data Structures

1. What are the advantages and disadvantages of using an Adjacency Matrix vs an Adjacency List relative to size and speed of common operations?
* Adjacency Matrix - contains a lot of empty spaces in the 2 dimensional array and so iterating takes clearly more time to scan through it in order to find particular data. However, if we know index of particular data it will take O(1) to access it.

* Adjacency List - is more efficient in terms of space taken and time of scanning through the whole database which is slimmer. However, accessing particular in the database is less efficient as we need to scan through the edges in order to find it.

2. What would the Big O be of inserting a new EDGE to:
* An Edge List? O(N)
* An Adjacency Matrix? O(1) - as the space is already there and nil
* An Adjacency List? O(1) - constant


3. What would the Big O be of inserting a new VERTEX to:
An Edge List? If it's only vertex with no edge - O(n)
* An Adjacency Matrix? O(n) - we need to create new space in memory for longer arrays
* An Adjacency List? O(1)

4. What would the Big O be of REMOVING a vertex or edge from:
* An Edge List?  O(n)
* An Adjacency Matrix? O(n)
* An Adjacency List? O(1)

5.How would you find all the nodes connected to a particular vertex in:
* An Edge List? - by iterating through specific index in all arrays, index which holds the node and then see what edges does it have
* An Adjacency Matrix? - by scanning though all elements in one array relating to the specific node
* An Adjacency List? - find the vertex in the array and we have all the nodes there representing edges to this particular vertex.

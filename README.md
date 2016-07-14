Luke, Hannah

# assignment_graphs_trees
Rise over run.

[A Data Structures and Algorithms Ruby Assignment from the Viking Code School using Trees and Graphs](http://www.vikingcodeschool.com)



1.  What are the advantages and disadvantages of using an Adjacency Matrix vs an Adjacency List relative to size and speed of common operations?

The adjacency matrix has a bunch of blank/wasteful space but is very easy to index and access what you want.  It is also easy to insert and delete data.

2.  What would the Big O be of inserting a new EDGE to:
    An Edge List?  O(n), you have to build a new array to add an element
    
    An Adjacency Matrix?  O(n), you have to traverse the matrix and add an element to each row, as well as a new row

    [0,0,0,1]
    [0,0,0,2]
    [0,0,0,3]
    [4,5,6,7]
    
    An Adjacency List? O(n)   (best case is O(1))  You have to index the linked list, and then traverse it to add an item to the end

  3.  What would the Big O be of inserting a new VERTEX to:
    An Edge List?  O(n) You have to build a new array to add an element


    An Adjacency Matrix?  O(1) You just have to index the array and change the value (1 step)


    An Adjacency List? O(n)  You have to overwrite the array to add an element


    
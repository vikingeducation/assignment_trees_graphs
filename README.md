# assignment_graphs_trees
Rise over run.

### by Tim Scott

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


    An Adjacency Matrix?  O(1) You have to index the array and change the value (1 step)


    An Adjacency List? O(n)  You have to overwrite the array to add an element

  4. What would the Big O be of REMOVING a vertex or edge from:
        An Edge List? O(n). Have to rewrite array in memory
        An Adjacency Matrix? O(n). Have to remove whole column and row and rewrite the array
        An Adjacency List? O(n) worst case, O(1) best case

    5. How would you find all the nodes connected to a particular vertex in:
        An Edge List? O(n). You have to traverse the entire list and find any edges that originate or depart from particular vertex

        An Adjacency Matrix? O(n) Have to index and then traverse entire row. Also have to do the same for columns.

        An Adjacency List? O(1) just get the list at the corresponding index

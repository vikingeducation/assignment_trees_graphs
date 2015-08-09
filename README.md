# assignment_graphs_trees
Rise over run.

[A Data Structures and Algorithms Ruby Assignment from the Viking Code School using Trees and Graphs](http://www.vikingcodeschool.com)

Justin Mullis' fork

## What are the advantages and disadvantages of using an Adjacency Matrix vs an Adjacency List relative to size and speed of common operations?
The matrix is Ruby arrays for everything instead of just the initial lookup.  So reads are pretty simple and always just two steps, index the "from" main array and then index into the "to" array you've selected.  The matrix does take up more space than needed showing all the non-existent edges.  Adding additional vertices would require a complete rebuild of the matrix as its written.

The Adjacency List is less memory intensive, storing on what is needed, but due to using linked lists has a higher Big O for most functions

##What would the Big O be of inserting a new EDGE to:
>An Edge List?
>An Adjacency Matrix?
>An Adjacency List?


=begin
  Part 1: Binary Search Tree

  Binary Tree

  A Binary Search Tree is a highly structured way of storing comparative data which optimizes it for future searching. We'll learn more about how useful they can be shortly but, for now, why not build one?

  Binary Tree Rules

  The rules for a binary search tree are as follows:

  1. The first number is the root node.
  2. The left sub-tree always contains lower numbers while the right subtree always contains higher numbers.
  3. When adding a new number, a few scenarios guide what will happen:
  4. If new number is less than the current node and the current node has no LEFT number, the new number becomes that node's LEFT number. If there is already a LEFT node, move down to that node (set it as the "current node") and repeat this procedure.
  5. If new number is greater than the current node and the current node has no RIGHT vlue, the new number becomes that node's RIGHT number. If there is already a RIGHT node, move down to that node (set it as the "current node") and repeat this procedure.
  6. Assume: You will be working with nonrepeating integers.

  Your Task

  Your job is to build a Binary Search Tree out of a simple array of data and then display it to the screen.

  0. Build a BinaryTree class that takes an array as an argument. (DONE)
  1. Build your tree from the array. (DONE)
  2. Verify that the tree works by outputting it in the simplest possible fashion (DONE)
  3. and inspecting that output for accuracy. (DONE)
  4. You might try copying the inspect output of your tree into a text editor and manually formatting it properly.

  (Optional) Clean up the output to show a prettier tree like the one below (this is actually pretty challenging)

  Terminology tip: Remember that trees use "Nodes" and graphs use "Vertices"

  binary_tree = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])
  # Your tree:
  #           8
  #       /       \
  #     3          10
  #  /      \         \
  # 1        6         14
  #       /    \      /
  #      4      7   13

=end

# Setting up binary tree node.
BinaryNode = Struct.new(:left, :right, :number)

class BinaryTree

  attr_reader :root_node

  def initialize(array)
    @array = array
    @root_node = BinaryNode.new(nil, nil, array[0])
    build_tree
  end

  def build_tree
    index = 1
    # I need to go through each item in the array and decides whether to put it on the left or right. 
    # I need to compare with the root nodes number and depending on smaller or larger...
    # If there's no number on the decided side, then I need to create a new struct on that side. eg @rood_node.left = Struct.new(nil, nil, array[1])
    # I need to do it via a counter as well.
    while index < @array.length
      new_node(index)
      index += 1
    end
  end


  def new_node(index)
    # standard crawler
    current_node = @root_node

    loop do
      # If item is smaller than the current node's number
      # Go left
      # If there's no value in left then we build a new node and break
      # If there's a value then we crawl to that node and loop again.
      # Same goes on the right hand side.
      # I can't think of any ways to break this down even further.
      if @array[index] < current_node.number
        if current_node.left.nil?
          current_node.left = BinaryNode.new(nil, nil, @array[index])
          break
        else
          current_node = current_node.left
        end
      else
        if current_node.right.nil?
          current_node.right = BinaryNode.new(nil, nil, @array[index])
          break
        else
          current_node = current_node.right
        end
      end
    end
    # Calling the output for each index
    output_item_and_position(index)
  end

  # 2. Verify that the tree works by outputting it in the simplest possible fashion.
  def output_item_and_position(index)
    output = "#{@array[index]}: "
    puts "Root: #{@array[0]}" if index == 1
    current_node = @root_node
    loop do
      if @array[index] < current_node.number
        output += "L"
        break if current_node.left.number == @array[index]
        current_node = current_node.left
      else
        output += "R"
        break if current_node.right.number == @array[index]
        current_node = current_node.right
      end
    end
    puts output
  end

end

BinaryTree.new([8,10,3,1,6,14,4,7,13])
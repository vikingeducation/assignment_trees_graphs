require 'pry'

BinaryNode = Struct.new(:value, :left, :right)


class BinaryTree

  attr_accessor :root

  def initialize(array)
    @tree = array
    @root = BinaryNode.new(@tree.shift, nil, nil)
  end

  def make_tree
    @tree.each do |num|
      add_node(num)
    end
  end

  def add_node(num)
    curr_node = @root
    until curr_node.nil?
      if num < curr_node.value
        if curr_node.left.nil?
          curr_node.left = BinaryNode.new(num, nil, nil)
          curr_node = curr_node.left
        end
        curr_node = curr_node.left
      elsif num > curr_node.value
        if curr_node.right.nil?
          curr_node.right = BinaryNode.new(num, nil, nil)
          curr_node = curr_node.right
        end
        curr_node = curr_node.right
      end
    end


  end

end

=begin
load 'binary_tree.rb'
a = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])
a.make_tree
=end
require_relative 'binary_tree.rb'

class BinaryTree

  attr_reader :root

  
  def initialize(values=[])
    build_tree(values)
  end


  def insert(value, parent=nil)
    # insert node with value
    if @root

    else
      
    end
  end


  def search(value)
    # return node and depth?
  end



  private
  def build_tree(values)
    values.each { |value| insert(value) }
  end


  def build_node(values, parent=nil)
  end


  def middle_value_of(values)
    values.sort
    middle_index = middle_index_of(values)
    values[middle_index]
  end


  def left_value_of(values)
    values.last if values
  end


  def right_value_of(values)
    values.first if values
  end


  def left_array_of(values)
    last_index = middle_index_of(values) - 1
    left = values[0..last_index]
  end


  def right_array_of(values)
    first_index = middle_index_of(values) + 1
    values[first_index..-1]
  end


  def middle_index_of(values)
    values.length / 2
  end
end


require_relative 'binary_node.rb'

class BinaryTree

  attr_reader :root,
              :length

  
  def initialize(*values)
    values = values.first if values.first && values.first.is_a?(Array)
    @length = 0
    build_tree(values)
  end


  # Inserts a node at the
  # appropriate place in the tree
  def insert(value)
    if @root
      insert_child(value, @root)
    else
      @root = BinaryNode.new(value)
    end
    @length += 1
  end


  # Returns a node with
  # an exact matching value
  # or nil if one was no found
  def search(value)
    node = @root
    while node
      if value > node.value
        node = node.right
      elsif value < node.value
        node = node.left
      else
        break
      end
    end
    node
  end


  # Returns the node
  # with the closest matching value
  # or nil if there is no root
  def closest(value)
    closest = node = @root
    while node
      if value > node.value && node.right && node.right.value < value
        node = node.right
      elsif value < node.value && node.left && node.left.value > value
        node = node.left
      else
        break
      end
      closest = node
    end
    closest
  end


  def balance
    # Not yet implemented
    puts "Standing on one foot now..."
  end



  private
  def build_tree(values)
    values.each do |value|
      insert(value)
    end
  end


  def insert_child(value, node)
    if value < node.value
      if node.left
        insert_child(value, node.left)
      else
        node.left = BinaryNode.new(value)
        node.left.parent = node
      end
    elsif value > node.value
      if node.right
        insert_child(value, node.right)
      else
        node.right = BinaryNode.new(value)
        node.right.parent = node
      end
    end
  end
end


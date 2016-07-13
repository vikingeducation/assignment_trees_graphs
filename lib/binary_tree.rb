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
    pseudo_root = BinaryNode.new
    pseudo_root.right = @root
    root = tree_to_vine(pseudo_root)
    root = vine_to_tree(pseudo_root)
    @root = pseudo_root.right
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
      end
    elsif value > node.value
      if node.right
        insert_child(value, node.right)
      else
        node.right = BinaryNode.new(value)
      end
    end
  end


  def tree_to_vine(root)
    tail = root
    remainder = tail.right
    size = 0
    until remainder.nil?
      if remainder.left.nil?
        tail = remainder
        remainder = remainder.right
        size += 1
      else
        temp = remainder.left
        remainder.left = temp.right
        temp.right = remainder
        remainder = temp
        tail.right = temp
      end
    end
    @length = size
    root
  end


  def vine_to_tree(root)
    leaf_count = @length + 1 - 2 ^ Math.log2(@length + 1).floor
    root = compression(root, leaf_count)
    size = @length
    size -= leaf_count
    while size > 0
      compression(root, size / 2)
      size /= 2
    end
    root
  end


  def compression(root, count)
    scanner = root
    count.times do
      child = scanner.right

      byebug unless child.right

      scanner.right = child.right if child.right
      scanner = scanner.right
      child.right = scanner.left if scanner.left
      scanner.left = child
    end
    scanner
  end  
end


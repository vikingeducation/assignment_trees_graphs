require_relative 'node'

class BinaryTree
  attr_reader :head
  def initialize(arr)
    raise "Please provide an array" unless arr.is_a?(Array)
    @arr = arr
    build_tree
    build_arr
  end

  def add_node(item)
    if @head
      current = @head
      counter = 0
      until current.nil?
        prev = current
        current = item < current.data ? current.left : current.right
        counter += 1
      end
      current = Node.new(item)
      item < prev.data ? (prev.left = current) : (prev.right = current)
    else
      @head = Node.new(item)
    end
  end

  def build_tree
    @arr.each do |el|
      add_node(el)
    end
  end


  def build_arr
    arr = [@head]
    current = @head
    @tree = []
    row_count = arr.size
    depth = 0
    until arr.empty?
      arr << current.left if  current.left
      arr << current.right if current.right
      @tree[depth] = @tree[depth].nil? ? [arr[0].data] : @tree[depth].push(arr[0].data)
      row_count -= 1
      arr.shift
      if row_count == 0
        row_count = arr.size
        depth += 1
      end
      current = arr[0]
    end
  end

  def print_tree
    width = (2 ** (@tree.size-1))
    @tree.each_with_index do |row, r|
      row.each_with_index do |item, i|
        print  "#{item}".center(width/row.size)
      end
      puts
    end
  end
end

b = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])
b.print_tree

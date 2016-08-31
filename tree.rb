Node = Struct.new(:left, :right, :data)

class BinaryTree
  attr_accessor :root
  def initialize(data_array)
    @root = Node.new(nil, nil, data[0])
    @current = @root
    add_all_nodes data[1..-1]
  end

  def add_all_nodes(data)
    data.each do |data|
      add_node data
    end
  end

  def add_node(data)
    node = Node.new(nil, nil, data)
    loop do
      if node.data < @current.data && @current.left.nil?
        @current.left = node
        break
      elsif node.data < @current.data && !@current.left.nil?
        @current = @current.left
      elsif node.data > @current.data && @current.right.nil?
        @current.right = node
        break
      elsif node.data > @current.data && !@current.right.nil?
        @current = @current.right
      else
        puts 'Wrong data'
        exit
      end
    end
    @current = @root
  end
end

Node = Struct.new(:left, :right, :data)

class Tree

  attr_reader :root_node, :array

  def initialize(array)
    @root_node = Node.new(nil, nil, array[0])
    array.shift
    @array = array
  end

  def create_tree(current_node = @root_node)
    @array.each { |value| add_node(value) } 
  end

  def find_node(value, current_node = @root_node)
    raise ArgumentError, "value must be a number!" unless value.is_a?(Numeric)

    return current_node if value == current_node.data

    if value > current_node.data
      current_node.right.nil? ? nil : find_node(value, current_node.right)
    else
      current_node.left.nil? ? nil : find_node(value, current_node.left)
    end      
  end

  def add_node(value, current_node = @root_node)
    raise ArgumentError, "value must be a number!" unless value.is_a?(Numeric)

    if value > current_node.data  
      current_node.right.nil? ? current_node.right = Node.new(nil, nil, value) : 
        add_node(value, current_node.right)
    else
      current_node.left.nil? ? current_node.left = Node.new(nil, nil, value) :
        add_node(value, current_node.left)
    end          
  end

  def display_tree(current_nodes)
    raise ArgumentError, "Must pass in the root node!" unless current_nodes.is_a?(Array)

    return if current_nodes.compact.length == 0

    current_nodes = current_nodes.compact
    current_nodes.each do |node|
      print "#{node.data} #{" " * 3}"      
    end
    puts "\n\n"
    new_nodes = []
    current_nodes.each do |node|
      new_nodes << node.left
      new_nodes << node.right
    end
    display_tree(new_nodes)        
  end

end




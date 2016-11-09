Node = Struct(:number, :small_child, :big_child)

class BinaryTree
  def initialize(data)
    @inital_data = data
    @root = nil
  end

  def render

  end

  def add_node(number) 
    node = create_node(number)
    unless @root 
      @root = node
    else
      target_node = crawl(number)
      add_child_node
    end
  end

  def add_child_node
    if target_node.number > node.number 
       target_node.small_child = node
    else 
      target_node.big_child = node
    end
  end

  private 

  def create_node(number)
    Node.new(number, nil, nil)
  end

end


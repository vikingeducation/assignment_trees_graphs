Node = Struct.new("Node", :left, :right, :data)

class BST
  attr_accessor :tree

  def initialize(data = nil)
    @tree = build_tree(data)
  end

  def self.build_tree(obj, tr)
    if tr.nil?
      Node.new(nil, nil, obj)
    elsif obj < tr.data
      Node.new(
        build_tree(obj, tr.left),
        tr.right,
        tr.data
      )
    else
      Node.new(
        tr.left,
        build_tree(obj, tr.right),
        tr.data
      )
    end
  end

  def self.traverse(tr)
    tr ? BST.traverse(tr.left) + [tr.data] + BST.traverse(tr.right) : []
  end

  def build_tree(data)
    return if data.nil?
    data.reduce(tree) do |tr, item|
      BST.build_tree(item, tr)
    end
  end

  def traverse
    BST.traverse(tree)
  end

end

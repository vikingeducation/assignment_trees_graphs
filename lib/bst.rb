Node = Struct.new("Node", :left, :right, :data)

class BST
  attr_accessor :tree

  def initialize(data = nil)
    @tree = build_tree(data)
  end

  def self.build_tree_(obj, tr)
    if tr.nil?
      Node.new(nil, nil, obj)
    elsif obj < tr.data
      Node.new(
        build_tree_(obj, tr.left),
        tr.right,
        tr.data
      )
    else
      Node.new(
        tr.left,
        build_tree_(obj, tr.right),
        tr.data
      )
    end
  end

  def build_tree(data)
    return if data.nil?
    data.reduce(tree) do |tr, item|
      BST.build_tree_(item, tr)
    end
  end

  def self.traverse_(tr)
    tr ? BST.traverse_(tr.left) + [tr.data] + BST.traverse_(tr.right) : []
  end

  def traverse
    BST.traverse_(tree)
  end

end

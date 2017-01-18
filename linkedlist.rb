Node = Struct.new(:id, :name, :weight, :next)

class LinkedList
  attr_accessor :first

  def initialize(first = nil)
    @first = first
    @last = first
  end

  def add_first(id, name, weight=nil)
    @first = Node.new(id, name, weight)
    @last = @first
  end

  def add_node(id, name, weight=nil)
    if @first.nil?
      add_first(id, name, weight)
    else
      new_node = Node.new(id, name, weight)
      unless node_exists?(new_node)
        @last.next = new_node
        @last = new_node
      end
    end
  end

  def node_exists?(new_node)
    current = @first
    until current.nil?
      return true if new_node.id == current.id
      current = current.next
    end
    false
  end



end

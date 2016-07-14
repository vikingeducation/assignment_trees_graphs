Node = Struct.new(:id,:weight,:next_node)

class LinkedList
  attr_reader :first, :last

  def initialize
    @first=nil
    @last=nil
  end

  def add_node(id, weight)
    if @first.nil?
      @first=Node.new(id,weight,nil)
      @last=@first
    else
      new_node=Node.new(id,weight,nil)
      @last.next_node=new_node
      @last=new_node
    end
  end

  def find_last_node
    pointer=@first.next_node
    until pointer.nil?
      pointer=pointer.next_node
    end
    pointer
  end

  def find_node(id)
    #return if @first == nil
    current_node = @first
    until current_node.id == id
      current_node = current_node.next_node
      return nil if current_node == nil
    end
    current_node
  end

end
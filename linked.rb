Node = Struct.new(:data, :next)

# linked list
class Linked
  def initialize
    @first = nil
    @last = nil
    @current = nil
    @len = 0
  end

  def length
    @len
  end

  def insert_end(data)
    @first.nil? ? first_node(data) : add_node(data)
    @len += 1
  end

  def insert_at(index, data)
    return insert_end(data) if index >= @len
    find(index)
    new_node = Node.new(data, @current)
    @current = new_node
    @first = new_node if index.zero?
    @len += 1
  end

  def read(index)
    return puts "Index #{index} out of bounds" if index >= @len
    find(index)
    @current.data
  end

  private

  def first_node(data)
    @first = Node.new(data, nil)
    @last = @first
  end

  def add_node(data)
    last_node = @last
    @last = Node.new(data, nil)
    last_node.next = @last
  end

  def find(index)
    return @current = @last if index > (@len - 1)
    @current = @first
    traverse_count = 0
    until traverse_count == index
      @current = @current.next
      traverse_count += 1
    end
    @current
  end
end


if __FILE__ == $PROGRAM_NAME
  llist = Linked.new
  llist.insert_end('dog')
  llist.insert_end('cat')
  puts llist.read(0)
  puts llist.read(1)
end

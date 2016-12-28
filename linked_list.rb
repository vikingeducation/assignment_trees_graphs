Node = Struct.new(:weight, :oid, :did, :next)

class LinkedList

    attr_accessor :head, :last

  	def add_node(weight, oid, did)
        if @head.nil?
      		  @head = Node.new(weight, oid, did, nil)
    		    @last = @head
        else
      		  new_node = Node.new(weight, oid, did, nil)
      		  @last.next = new_node
      		  @last = new_node
        end
  	end

    def find_node(index)
      counter = 0
      current_node = @head

      while counter < index
          current_node = current_node.next
          counter += 1
      end
      current_node
    end

    def find_next(node)
      node.next
    end
end
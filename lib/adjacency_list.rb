
require_relative 'edge_list.rb'
require_relative 'linked_list.rb'


class AdjacencyList

attr_accessor :edge_list, :list

  def initialize
    @edge_list = EDGE_LIST
    @list = []
    run
  end

  def create_ll
    @edge_list.each do |from, to, weight|
      if @list[from.id]
        # Append to the from node
        @list[from.id].add_node(to.id, to.name, weight) 
      else
        # Add the head from node
        @list[from.id] = LinkedList.new(Node.new(from.id, from.name, weight))
        # Add the first to node
        @list[from.id].add_node(to.id, to.name, weight)
      end
    end
  end
 

  def run
    create_ll
    print_list
  end


  def print_list
    @list.each do |ll|
      if (ll.nil?)
        puts "X"
      else
        current_node = ll.head
        print "#{current_node.name} - "

        until(current_node.next.nil?)
          current_node = current_node.next
          print "#{current_node.name}(#{current_node.weight})"
          print ", " unless current_node.next.nil?
        end
        puts ""
      end
    end
  end

  
  def edge_weight(from,to)

    weight = 0

    # Validate the nodes passed in
    if (0..19).include?(from) && (0..19).include?(to)
      ll = @list[from]
      if (ll.nil?)
        return "No nodes"
      else 
        head_node = ll.head
        # Check if there is any edge from the head from node
        if(head_node.next.nil?)
          weight = head_node.weight
        else
          # Loop through to nodes
          current = head_node.next
          until(current.nil?)
            if(current.id == to)
              weight = current.weight
              break
            else
              current = current.next
            end
          end
        end
      end
      weight
    end
  end
end

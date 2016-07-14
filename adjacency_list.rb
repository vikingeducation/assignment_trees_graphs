#[LL,LL]
require 'edge_list'

Node = Struct.new(:id, :name, :next_node)

class AdjacencyList
  def initialize(edge_list)
    @edge_list = edge_list
    @array = Array.new(20) { nil }
    populate_list
  end


  def populate_list
    @edge_list.each do |edge|
      origin = edge[0]
      new_person = edge[1]
      new_node = create_node(first_person)
      current_node = new_node
      
      begin 
        if array[origin.id].nil?    
          @array[origin.id] = new_node if current_node == new_node

        else
          node = 
        end
      end until current_node.next_node.nil?



    end
  end

  def create_node(person)
    Node.new(person.id, person.name, nil)
  end

end
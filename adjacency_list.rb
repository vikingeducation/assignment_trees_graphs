#[LL,LL]
require_relative 'edge_list'

Node = Struct.new(:id, :name, :next_node)

class AdjacencyList
  attr_reader :array

  def initialize(edge_list)
    @edge_list = edge_list
    @array = Array.new(20) { nil }
    populate_list
  end


  def populate_list
    previous_node = nil
    
    @edge_list.each do |edge|
      origin = edge[0]
      new_person = edge[1]
      new_node = create_node(new_person)
      
      current_node = new_node

      loop do
        if array[origin.id].nil?
          previous_node = current_node
          @array[origin.id] = new_node if current_node == new_node
          break
        elsif current_node.next_node.nil?
          previous_node.next_node = new_node
          previous_node = current_node
          break
        else
          current_node = current_node.next_node
        end
      end 

    end

    @array
  end

  def create_node(person)
    Node.new(person.id, person.name, nil)
  end

end

p AdjacencyList.new(EDGE_LIST).array

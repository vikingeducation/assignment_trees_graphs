require_relative "adjacency_matrix"

Human = Struct.new(:id, :name, :weight, :next)

class AdjacencyList

  attr_reader :adj_list, :matrix, :clean_matrix, :matrix_with_structs

  def initialize(edge_list)
    @matrix = AdjacencyMatrix.new(edge_list)
    @adj_list = @matrix.person_structs.map { |struct| Human.new(struct.id, struct.name) }
    @matrix_with_structs = @matrix.adj_matrix.map do |row|
      row.each_with_index do |weight, index|
        row[index] = Human.new(index, @adj_list[index].name, weight) unless weight.nil?
      end
    end

    @clean_matrix = @matrix_with_structs.map { |row| row.compact }
  end
  
  def add_nodes
    @adj_list.each_with_index do |struct, index|
      last = struct
      @clean_matrix[index].each do |node|
        if @clean_matrix[index].length > 0
          last.next = node
          last = node
        end
      end 
    end
  end 

  def get_all_links(current_node, all_links = [])
    return all_links if current_node.nil?

    all_links << current_node
    get_all_links(current_node.next, all_links)
  end

  def display_adj_list
    @adj_list.each do |head_node|
      get_all_links(head_node).each { |node| print "#{node.name}, #{node.weight} #{" " * 2}" }
      puts "\n\n" 
    end
    nil
  end

  def edge_weight(id_from, id_to)
    all_connections = get_all_links(@adj_list[id_from])
    return nil if all_connections.length == 1
    matching_connection = all_connections.find { |node| node.id == id_to }
    matching_connection.weight unless matching_connection.nil?
  end
end







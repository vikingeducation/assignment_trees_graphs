require_relative 'edge_list'

Vertex = Struct.new(:id, :name, :weight, :next)

class AdjacencyList
  attr_accessor :list, :names
  def initialize list
    @names = []
    @list = create_adj_list list
  end

  def create_adj_list list
    ad_list = []
    list.each do |edge|
      from, to, weight = edge
      if ad_list[from.id].nil?
        ad_list[from.id] = Vertex.new(to.id, to.name, weight, nil)
      else    
        current_vertex = ad_list[from.id]
        until current_vertex.next.nil?
          current_vertex = current_vertex.next
        end
        current_vertex.next = Vertex.new(to.id, to.name, weight, nil)
      end

      if ad_list[to.id].nil?
        ad_list[to.id] = Vertex.new(from.id, from.name, weight, nil)
      else    
        current_vertex = ad_list[to.id]
        until current_vertex.next.nil?
          current_vertex = current_vertex.next
        end
        current_vertex.next = Vertex.new(from.id, from.name, weight, nil)
      end
      @names[from.id] = from.name
      @names[to.id] = to.name
    end
    ad_list
  end

  def print_adj_list
    @list.each_with_index do |person, index|
      print "#{@names[index]} ".center(10)
      current_vertex = person
      until current_vertex.nil?
        print "#{current_vertex.name}(#{current_vertex.weight}), "
        current_vertex = current_vertex.next
      end
      puts
    end
  end

  # 0(d) with d the number of edges of a vertex, worse case have to go through all the degrees of a vertex
  def edge_weight(from, to)
    unless @list[from].nil?
      current_vertex = @list[from]
      until current_vertex.id == to || current_vertex.nil?
        current_vertex = current_vertex.next
      end
      current_vertex.weight
    end
  end
  # O(n), have to loop through the Array to count
  def total_vertices
    @list.length
  end

end

el = EdgeList.new( 5, 5 ).list
al = AdjacencyList.new( el )

al.print_adj_list
puts "Weight of Alice and Boris is #{al.edge_weight(1, 4)}"
puts al.total_vertices
al.most_connected
require_relative 'edge_list'

class AdjacencyMatrix

  def initialize( edge_list )
    @edge_list = edge_list.list
    @people = edge_list.people
    @matrix = []
  end


  def build_matrix
    build_empty_matrix

    @edge_list.each do |edge|
      from = edge[0].id
      to = edge[1].id
      weight = edge[2]

      @matrix[from][to] = weight
      @matrix[to][from] = weight
    end  
    
  end


  def print_matrix
    longest_name = ( @people.max_by { |person| person.name.length } ).name
    offset = longest_name.length + 2

    # header
    print "".ljust(offset)
    @people.each do |person|
      print "#{person.name}".ljust(offset)
    end
    print "\n"

    # rows
    @matrix.each_with_index do |row, id|
      print "#{@people[id].name}".ljust(offset)
      row.each do |edge|
        if edge.nil?
          print "-".ljust(offset)
        else
          print "#{edge}".ljust(offset)
        end
      end
      print "\n"
    end

  end


  def edge_weight(from, to)
    @matrix[from][to]
  end


  def show_stats
    puts "Matrix Stats"
    puts "Vertices: #{@people.length}"
    puts "Nodes: #{@people.length * 2}"
    
    puts "Most connected people:"
    top_three_connections
  end


  def top_three_connections
    num_connections = []

    @people.each do |person|
      id = person.id
      total = @matrix[id].count { |edge| !edge.nil? }
      num_connections << [id, total]
    end

    num_connections.sort! { |a,b| a[1] <=> b[1] }
    top_three = num_connections.reverse.take(3)

    top_three.each do |person|
      id = person[0]
      total = person[1]
      puts "#{@people[id].name} - #{total} connections"
    end
  end


  private

  def build_empty_matrix
    size = @people.length
    
    size.times { @matrix << Array.new(size, nil) }
  end
  
  
end


el = EdgeList.new
am = AdjacencyMatrix.new(el)
am.build_matrix
am.print_matrix
am.show_stats
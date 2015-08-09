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


  private

  def build_empty_matrix
    size = @people.length
    
    size.times { @matrix << Array.new(size, nil) }
  end
  
  
end
require_relative 'edge_list'

class AdjacencyMatrix
  attr_reader :list
  attr_accessor :matrix, :names
  def initialize list
    @names = []
    @list = list
    @matrix = Array.new(max_id) {Array.new(max_id)}
    create_matrix
  end

  def max_id
    max_num = []
    @list.each do |edge|
      from, to, weight = edge
      max_num << from.id
      max_num << to.id
    end
    max_num.max + 1
  end


  def create_matrix
    @list.each do |edge|
      from, to, weight = edge
      @matrix[from.id][to.id] = weight
      @matrix[to.id][from.id] = weight
      @names[from.id] = from.name
      @names[to.id] = to.name
    end
  end

  #If the Edge_list is (10, 3) for example, error, @names doesnt exist
  def longest_name
    if @names.nil?
      return "develop"
    else
      @names.max_by(&:length)
    end
  end


  def print_matrix
    cell_size = longest_name.length + 1
    print " " * cell_size

    @names.each do |person|
      print "#{person}".center(cell_size)
    end
    puts
    count = 0
    @matrix.each do |person|
      print "#{@names[count]} ".center(cell_size)
      person.each do |connection|
        if connection.nil?
          print "X".center(cell_size)
        else
          print "#{connection}".center(cell_size)
        end
      end
      print "\n"
      count += 1
    end
  end

  def edge_weight(from, to)
    @matrix[from][to]
  end

  # O(n), need to loop through the Array to count
  def total_nodes
    @matrix.length
  end

end

el = EdgeList.new(5,2).list
am = AdjacencyMatrix.new(el)
am.print_matrix
puts "from id1, to id2 : #{am.edge_weight(1,2)}"
puts am.total_nodes
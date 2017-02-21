require_relative 'edge_list'

class AdjacencyMatrix
  def initialize(list)
    @matrix = []
    @names = {}
    import_list(list)
  end

  def import_list(list)
    list.each do |row|
      from = row[0].id
      to = row[1].id
      @names[from] = row[0].name
      @names[to] = row[1].name
      @matrix[from] = [] unless @matrix[from]
      @matrix[from][to] = row[2]
      @matrix[to] = [] unless @matrix[to]
      @matrix[to][from] = row[2]
    end
  end

  def print_matrix
    print " " * 4
    @matrix.each_with_index do |from, f|
      print "#{@names[f][0..2]} " if @names[f]
    end
    puts "\n"
    @names.size.times do |i|
      print "#{@names[i][0..2]}  " if @names[i]
      @names.size.times do |j|
        item = @matrix[i][j]
        print " - " unless item
        print (item > 9 )? "#{item} " : " #{item} " if item
        print " "
      end
      puts
    end
  end

  def show_stats

  end

  def edge_weight(from, to)
    @matrix[from][to]
  end

end


am = AdjacencyMatrix.new(EDGE_LIST)
am.print_matrix

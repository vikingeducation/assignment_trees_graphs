# convert el to am

class AdjacencyMatrix
  attr_accessor :am, :unique_points

  def initialize(edge_list)
    up = AdjacencyMatrix.unique_points(edge_list){|i| i.is_a? Person}
    @am = AdjacencyMatrix.from_edge_list(edge_list, up.count)
    @unique_points = up
  end

  def self.unique_points(edge_list)
    edge_list.reduce(Set.new) do |acc, row|
      acc + row.reduce(Set.new) do |partial, item|
        yield(item) ? acc.add(item) : acc
      end
    end
  end

  def self.from_edge_list(edge_list, len)
    acc = Array.new(len){ Array.new(len) }
    edge_list.each do |row|
      from, to, weight = row[0], row[1], row[2]
      acc[from.id][to.id] = weight
    end
    acc
  end

  #   (0...len).each do |i|
  #     row = edge_list[i]
  #     # there's no such row..
  #     next if row.nil?
  #     # if the from.id does not equals the index, then they don't link to
  #     # any point, so nothing needs to be done since the rows are already nil
  #     if row[0].id == i
  #       from, to, weight = row[0], row[1], row[2]
  #       acc[i][to.id] = weight
  #     end
  #   end
  #   acc
  # end

  def print_matrix
    persons = unique_points.to_a.sort{|x, y| x.id <=> y.id}
    print "\t "
    #persons.each{ |p| print("  #{p.id}  ") }
    persons.each do |p|
      len = p.id.to_s.length
      len == 1 ? print("   #{p.id}  ") : print("  #{p.id}  ")
    end
    puts
    (0...persons.count).each do |i|
      p = persons[i]
      puts
      row = am[i]
      print("#{p.name} ")
      if p.name.length < 7
        print("\t ")
      elsif p.name.length == 7
        print(" ")
      else
        print("")
      end
      row.each do |cell|
        len = cell.to_s.length
        if cell.nil?
          print("  --  ")
        else
          len == 1 ? print("   #{cell}  ") : print("  #{cell}  ")
        end
      end
      print(" #{p.id}")
    end
    nil
  end

  def edge_weight(from, to)
    am[from][to]
  end

end

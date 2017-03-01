# Create an AdjacencyList class which accepts the edge list and converts it
# to an Adjacency List. Use only arrays and linked lists

class AdjacencyList
  attr_accessor :al, :unique_points

  def initialize(edge_list)
    up = AdjacencyList.unique_points(edge_list){|i| i.is_a? Person}
    @al = AdjacencyList.from_edge_list(edge_list, up.count)
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
    acc = Array.new(len){ Array.new }
    edge_list.each do |row|
      from, to, weight = row[0], row[1], row[2]
      acc[from.id] += [[to.id, weight]]
    end
    acc
  end

  def print_al
    persons = unique_points.to_a.sort{|x, y| x.id <=> y.id}
    al.each_with_index do |row, i|
      p = persons[i]
      puts
      print("#{p.name}\t ")
      row.each do |item|
        if item.empty?
          print("  nil  ")
        else
          id, weight = item
          print("  #{persons[id].name}(#{weight})  ")
        end
      end
    end
    nil
  end

  # O(d)
  def edge_weight(from, to)
    to_and_weight = al[from].assoc(to)
    to_and_weight ? to_and_weight[1] : nil
  end

end

require_relative 'edge_list'

# import edge_list and create adjancecy matrix
class AdjancencyMatrix
  def initialize(edges)
    @adj_matrix = []
    @people = []
    load_edges(edges)
  end

  def print_matrix
    spacing = find_longest_name + 1
    print_header(spacing)
    print_rows(spacing)
  end

  def edge_weight(start_node, end_node)
    @adj_matrix[start_node][end_node]
  end

  private

  def load_edges(edges)
    people_count = max_person_id(edges) + 1
    @adj_matrix = Array.new(people_count) { Array.new(people_count) }
    @people = Array.new(people_count)
    edges.each do |e|
      @adj_matrix[e[0].id][e[1].id] = e[2]
      @adj_matrix[e[1].id][e[0].id] = e[2]
      @people[e[0].id] = e[0].name
      @people[e[1].id] = e[1].name
    end
  end

  def max_person_id(edges)
    people_id = []
    edges.each do |e|
      people_id << e[0].id
      people_id << e[1].id
    end
    people_id.max
  end

  def find_longest_name
    name_lengths = []
    @people.each do |p|
      name_lengths << p.length
    end
    name_lengths.max
  end

  def print_header(spacing)
    print ''.ljust(spacing)
    @people.each do |p|
      print p.ljust(spacing)
    end
    puts
  end

  def print_rows(spacing)
    @adj_matrix.size.times do |row|
      print @people[row].ljust(spacing)
      @adj_matrix.size.times do |col|
        weight = @adj_matrix[row][col]
        print weight.nil? ? 'X'.ljust(spacing) : weight.to_s.ljust(spacing)
      end
      puts
    end
  end
end

# test code
if __FILE__ == $PROGRAM_NAME
  adj = AdjancencyMatrix.new(EDGE_LIST)
  adj.print_matrix
  puts "Weight at edge 1,0 is #{adj.edge_weight(1, 0)}"
end

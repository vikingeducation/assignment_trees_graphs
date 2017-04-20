require_relative 'edge_list'
require_relative 'linked'

Relationship = Struct.new(:id, :weight)

# import edge_list and create adjancecy list
class AdjancencyList
  def initialize(edges)
    @adj_list = []
    @people = []
    load_edges(edges)
  end

  def print_list
    spacing = find_longest_name + 5
    print_rows(spacing)
  end

  # this is O(r) where r is relationships since it scans the whole list, but
  # significantly less than O(n) where n is total people.
  def edge_weight(start_node, end_node)
    relationships = @adj_list[start_node]
    relationships.length.times do |r|
      relationship = relationships.read(r)
      return relationship.weight if relationship.id == end_node
    end
    'None'
  end

  private

  def load_edges(edges)
    people_count = max_person_id(edges) + 1
    @adj_list = Array.new(people_count) { Linked.new }
    @people = Array.new(people_count)
    edges.each do |e|
      @adj_list[e[0].id].insert_end(Relationship.new(e[1].id, e[2]))
      @adj_list[e[1].id].insert_end(Relationship.new(e[0].id, e[2]))
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

  def print_rows(spacing)
    @adj_list.size.times do |person|
      print @people[person].ljust(spacing)
      relationships = @adj_list[person]
      relationships.length.times do |r|
        relationship = relationships.read(r)
        output = @people[relationship.id] + '(' + relationship.weight.to_s + ')'
        print output.ljust(spacing)
      end
      puts
    end
  end
end

# test code
if __FILE__ == $PROGRAM_NAME
  adj = AdjancencyList.new(EDGE_LIST)
  adj.print_list
  puts "Weight at edge 1,0 is #{adj.edge_weight(1, 0)}"
  puts "Weight at edge 4,9 is #{adj.edge_weight(4, 9)}"
end

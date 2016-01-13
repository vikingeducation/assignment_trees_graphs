require_relative './linkedlist.rb'
require_relative './edge_list.rb'


class AdjacencyList
    def initialize(edges)
        @people = edges.people
        @edges = edges.list
        @size = @people.length
        @adj_list = Array.new(@size)
        @people_hash = {}
        build_adjacency_list
    end

    def build_adjacency_list

      @people.each_with_index do |person, index|
        @people_hash[person.name] = index
        @adj_list[index] = LinkedList.new
        @adj_list[index].add_first_node(person.name, 0)
      end
      @edges.each do |edge|
        person1 = @people_hash[edge[0].name]
        person2 = @people_hash[edge[1].name]
        @adj_list[person1].add_node(edge[1].name, edge[2])
        @adj_list[person2].add_node( edge[0].name, edge[2] )
      end
    end

    def print_adj_list
      @adj_list.each_with_index do |person_list, index|
        print_list(person_list)
      end

    end

    def print_list(list)
      counter = 0
      print "#{list.head.name}:  "
      current_node = list.head
      unless list.head.next.nil?
        current_node = current_node.next
        loop do
          print "#{current_node.name}(#{current_node.value}), "
          break if current_node.next.nil?
          current_node = current_node.next
          counter += 1
        end
      end
      puts
    end

end
el = EdgeList.new( 4 )
adj = AdjacencyList.new( el )
adj.print_adj_list

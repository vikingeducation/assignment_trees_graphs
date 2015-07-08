class AdjacencyList

  attr_reader :person, :person_arr

  def initialize(edge_list)
    @num_of_people = 5
    @person_arr = Array.new(5) { Array.new() }
    @person = Array.new(5)
    build_arr(edge_list)
  end

  def build_arr(el)
    el.list.each do |edge|
      @person[edge[0].id] = edge[0]
      @person_arr[edge[0].id] << edge[1..2]
    end
  end

  def print_adj_list

    @person_arr.each_with_index do |person, i|

      unless person.empty?
        

        printf "%-12s", @person[i].name
        
        person.each do |edge|
          print "#{edge[0].name}(#{edge[1]}), "

        end
        print "\n"

      end

    end

  end

end
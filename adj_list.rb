class AdjacencyList

  def initialize(edge_list, num_of_person = 5)
    @num_of_people = num_of_person
    @person_arr = Array.new(@num_of_people) { Array.new() }
    @person = Array.new(@num_of_people)
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
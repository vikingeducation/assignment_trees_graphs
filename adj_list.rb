class AdjacencyList

  def intialize(edge_list)
    @num_of_people = 5
    @person_arr = Array.new(5) { Array.new() }
  end

  def build_arr(el)
    el.list.each do |edge|
      @person_arr[edge[0].id] << edge[1..2]
    end
  end

  def print_adj_list
  end

end
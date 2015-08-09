require_relative 'linkedlist'

class AdjacencyList

  def initialize( edge_list )
    @edge_list = edge_list.list
    @people = edge_list.people
    @adj_list = []
  end


  def build_adj_list

    @edge_list.each do |edge|
      from = edge[0].id
      to = edge[1].id
      weight = edge[2]

      @adj_list[from] = LinkedList.new if @adj_list[from].nil?
      @adj_list[to] = LinkedList.new if @adj_list[to].nil?  

      @adj_list[from].append(to, weight) 
      @adj_list[to].append(from, weight)
    end
    
  end


  def print_adj_list
    longest_name = ( @people.max_by { |person| person.name.length } ).name
    offset = longest_name.length + 1

    @adj_list.each_with_index do |list, id|
      print "#{@people[id].name}".ljust(offset)

      list = list.render_list

      list.each do |edge|
        to = @people[edge[0]].name
        print " #{to}(#{edge[1]})"
        print "," unless edge == list.last 
      end

      print "\n"
    end
  end


  def edge_weight(from, to)
    @adj_list[from].find_to(to)
  end
  
  
end
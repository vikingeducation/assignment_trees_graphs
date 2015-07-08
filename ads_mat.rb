require_relative 'edge_list'

class AdjacencyMatrix

  def initialize(edge_list)
    
    #@hash = {}
    @num_of_person = 4 #build_hash(edge_list)
    @arr = Array.new(@num_of_person) { Array.new(@num_of_person) }
    
    @people = Array.new(@num_of_person)
    build_array(edge_list)
  end

  # def build_hash(el)
  #   row_count=0
  #   el.list.each do |edge|
  #     unless @hash.has_key?(edge[0].id)
  #       @hash[edge[0].id] = row_count
  #       row_count += 1
  #     end
  #   end
  #   row_count
  # end

  def build_array(el)

    el.list.each do |edge|
      row = edge[0].id
      col = edge[1].id
      @arr[row][col] = edge[2]
      @people[row] = edge[0].name
      @people[col] = edge[1].name
      puts "weight is #{edge[2]}"
    end

  end

  def print_matrix

    @people.each {|name| print "      #{name}"}

    @arr.each do |row|

      print "#{@people[row]}"
      row.each {|ele| print "      #{ele}"}
      print "\n"

    end

  end
end















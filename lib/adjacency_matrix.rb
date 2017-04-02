
require_relative 'edge_list.rb'


class AdjacencyMatrix

attr_accessor :edge_list, :max_from_id, :max_to_id, :matrix, :from_names, :to_names

  def initialize
    @edge_list =  EDGE_LIST
    run
  end

  def get_max_ids
    @max_from_id = 0
    @max_to_id = 0

    @edge_list.each do |edge|
      if(edge[0].id > @max_from_id)
        @max_from_id = edge[0].id
      end

      if(edge[1].id > @max_to_id)
        @max_to_id = edge[1].id
      end
    end
  end

  def run
    get_max_ids
    create_matrix
    get_names_in_order
    populate_matrix
    print_matrix
  end


 def get_names_in_order
    @from_names = Array.new(@max_from_id+1)
    @to_names = Array.new(@max_to_id+1)

    @edge_list.each do |edge|
      @from_names[edge[0].id] = edge[0].name 
      @to_names[edge[1].id] = edge[1].name 
    end
  end

  def create_matrix
    @matrix = Array.new(@max_from_id+1) { Array.new (@max_to_id+1) }
  end

  def populate_matrix

     @edge_list.each do |edge|
      from_index = edge[0].id
      to_index = edge[1].id
      @matrix[from_index][to_index] = edge[2]
    end
  end

 

  def print_matrix

    # Print all the 'to' names
    @to_names.each do |name|
       print "#{name} "
     end
     puts ""

     counter = 0
     @matrix.each do |row|

      # Print the 'from' name for the row
      if(@from_names[counter].nil?)
        print " "
      else
        print "#{@from_names[counter]} "
      end

      # Print the weights for that row
      row.each do | weight|
        if(weight.nil?)
          print "X "
        else
          print "#{weight} "
        end
      end
      
      counter += 1
      puts ""
    end
  end
  
  def edge_weight(from,to)
    if (0..max_from_id).include?(from) && (0..max_to_id).include?(to)
      @matrix[from][to]
    end
    
  end

end

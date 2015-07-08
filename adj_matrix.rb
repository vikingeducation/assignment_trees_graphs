require_relative "edge_list.rb"

class AdjacencyMatrix

  def initialize (edge_list)
    @matrix = []
    @list = edge_list.list
  end


  def print_matrix

    @list.each do |pair|

      puts pair[0].name
      puts pair[1].name
      puts pair[2]
      # Hash w/ {} []
      # 1. id101 [[id101, id102, wt], [id103, wt]]
      # 2. Store ids in a hash
    end

  end

  def create_matrix
    ids = []
    simple_list = []
    @list.each do |pair|
      (0..1).each do |index|
        unless ids.include?(pair[index].id)
          ids << pair[index].id
        end
      end
    end
    @list.each do |pair|
      simple_list << [pair[0].id, pair[1].id, pair[2]]   #101, 102, 8
    end
    @matrix = Array.new(ids.length){Array.new(ids.length,0)}

    ids.each do |id1|
      ids.each do |id2|
        (0..(simple_list.length -1)).each do |i|
          if id1 == simple_list[i][0] && id2 == simple_list[i][1]
            @matrix << simple_list[i][2]
        end
      end
    end

  end

  # def get_names

  # end

  # def build_weight_array

  # end

end

#each pair ->[struc1, struct2, weight]
#each strict -> [id, name, email]
#@list=[
#[#<struct Person id=101, name="Michael", email="Michael101@bar.com">, #<struct Person id=102, name="Garrett", email="Garrett102@bar.com">, 8], 
#[#<struct Person id=101, name="Michael", email="Michael101@bar.com">, #<struct Person id=103, name="Tom", email="Tom103@bar.com">, 10], 
#[#<struct Person id=102, name="Garrett", email="Garrett102@bar.com">, #<struct Person id=103, name="Tom", email="Tom103@bar.com">, 4]]> 

     
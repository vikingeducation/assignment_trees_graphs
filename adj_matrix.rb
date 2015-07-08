require_relative "edge_list.rb"

class AdjacencyMatrix

  def initialize (edge_list)

    @list = edge_list.list

  end


  def print_matrix

    @list.each do |pair|

      puts pair[0].name
      puts pair[1].name
      puts pair[2]

    end

  end

  def get_names

  end

  def build_weight_array

  end

end

#each pair ->[struc1, struct2, weight]
#each strict -> [id, name, email]

#@list=[
#[#<struct Person id=101, name="Michael", email="Michael101@bar.com">, #<struct Person id=102, name="Garrett", email="Garrett102@bar.com">, 8], 
#[#<struct Person id=101, name="Michael", email="Michael101@bar.com">, #<struct Person id=103, name="Tom", email="Tom103@bar.com">, 10], 
#[#<struct Person id=102, name="Garrett", email="Garrett102@bar.com">, #<struct Person id=103, name="Tom", email="Tom103@bar.com">, 4]]> 

     
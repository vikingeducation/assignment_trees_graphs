require_relative "edge_list.rb"

class AdjacencyMatrix

  attr_reader :matrix, :list, :matrix_keys

  def initialize (edge_list)
    @list = edge_list.list
  end

  def print_matrix
    print " ".ljust(10)
    @matrix_keys.keys.each do |keys|
      print ("#{@matrix_keys[keys].name}  ").ljust(10)
    end
    puts
    @matrix.each_with_index do |line, indexrow|
      print (@matrix_keys["#{indexrow}"].name).ljust(10)
      line.each_with_index do |weight, indexcol|
        print "#{weight}".ljust(10)
      end
      puts
    end

  end

  def create_matrix
    @matrix_keys = {}
    simple_list = []
    keys = []
    #Create hash of matrix_keys
    @list.each do |pair|
      (0..1).each do |index|
        unless keys.include?(pair[index].id-101)
          keys << pair[index].id-101
          @matrix_keys["#{pair[index].id-101}"] = pair[index]
        end
      end
    end

    #Create simple_list #[[0, 1, 8],[0, 2, 10], [1, 2, 4]]
    @list.each do |pair|
      simple_list << [pair[0].id-101, pair[1].id-101, pair[2]]
    end

    @matrix = Array.new(@matrix_keys.length){Array.new(@matrix_keys.length,0)}

    simple_list.each do |edge| #[0, 1, 8]
      @matrix[edge[0]][edge[1]] = edge[2]
      @matrix[edge[1]][edge[0]] = edge[2]
    end

  end

  def edge_weight(first_node, last_node)
    @matrix[first_node-101][last_node-101]
  end
end

#each pair ->[struc1, struct2, weight]
#each strict -> [id, name, email]
#@list=[
#[#<struct Person id=101, name="Michael", email="Michael101@bar.com">, #<struct Person id=102, name="Garrett", email="Garrett102@bar.com">, 8], 
#[#<struct Person id=101, name="Michael", email="Michael101@bar.com">, #<struct Person id=103, name="Tom", email="Tom103@bar.com">, 10], 
#[#<struct Person id=102, name="Garrett", email="Garrett102@bar.com">, #<struct Person id=103, name="Tom", email="Tom103@bar.com">, 4]]> 

# Test Script
e = EdgeList.new(5)
am = AdjacencyMatrix.new(e)
print am.list
puts
am.create_matrix
am.print_matrix
puts
puts am.edge_weight(101,102)
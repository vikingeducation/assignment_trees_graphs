require_relative "edge_list.rb"



#<struct Person id=101, name="Xin", email="Xin101@bar.com">
class AdjacencyMatrix

  def initialize(amount_people)
    @amount_people = amount_people
    @list = EdgeList.new(amount_people)
    @matrix = Array.new (amount_people) {Array.new (amount_people)} 

  end

  def people_list
    array=[]
    @list.list.each do |arr|
      arr.each do |p|
        array<<p unless p.is_a? (Integer)
      end
    end
    array.uniq
  end
  
  def create_matrix
    for i in (0..@amount_people-1)
      @list.list.each do |arr|
        @matrix[i][arr[1].id]=arr[2] unless arr[1].id  == i
      end
    end
    p @matrix

  end

  def print_matrix
    # i=0
    # while i<@matrix.length
    
  end
  

end

matrix = AdjacencyMatrix.new(5)
matrix.create_matrix
matrix.print_matrix
puts matrix.people_list
puts matrix.people_list.length
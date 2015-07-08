require_relative "linked_list.rb"
require_relative "edge_list.rb"


class AdjacencyList
  attr_accessor :names
  def initialize(list)

    @edge_list = list
    @names = []

  end

  def create_buckets

    @edge_list.each do |arr_person|

      arr_person.each do |person|

        @names[person.id] = LinkedList.new unless person.is_a?(Integer) || @names[person.id]!=nil

      end
    end
    @names
  end

  def people_list
    array=[]
    @edge_list.each do |arr|
      arr.each do |p|
        array<<p unless p.is_a? (Integer)
      end
    end
    array.uniq
  end

  def add_people
    @edge_list.each do |arr_person|
      
      @names[arr_person[0].id].add_node(arr_person[1],arr_person[2]) 
    end
    
  end

  def  print_adj_list
    i=0
    while i < @names.length
      
        puts "#{people_list[i].name} has friends: "
        if @names[i] == nil
          puts "X"
        else
          puts "#{@names[i].read}"
        end
      i+=1
    end
  end

  def edge_weight(id1,id2)
    puts "#{people_list[id1].name} has a friend #{people_list[id2].name} with weight #{@names[id1].find(id2).weight}" unless @names[id1]==nil

  end

end





el = EdgeList.new.list
al = AdjacencyList.new( el )

al.create_buckets
al.add_people
al.print_adj_list

al.edge_weight(0,1)


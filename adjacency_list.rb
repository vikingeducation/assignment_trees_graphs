require_relative "linked_list.rb"

class AdjacencyList

  def initialize(list)

    @edge_list = list
    @names = {}

  end

  def create_buckets

    @edge_list.each do |arr_person|

      arr_person.each do |person|

        @names[person.name] = nil unless person.is_a?(Integer)

      end

    end

  end

  def add_people

    @edge_list.each do |arr_person|



    end

  end

end





el = EdgeList.new.list
al = AdjacencyList.new( el )
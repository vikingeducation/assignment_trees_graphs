require 'pry'
require 'prime'

module DataStructuresAssignment

  class Node
    attr_reader :data, :pointer

    def initialize(data)
      @data = data
      @pointer = nil
    end

    def set_pointer(node)
      @pointer = node
    end

  end

  class LinkedList
    attr_reader :head, :tail, :size

    def initialize(node = nil)
      @head = node
      @tail = @head
      #Keep track of size.
      @size = 1
    end

    def insert( data, position )
      node = Node.new(data)
      case position
      #Insert at head
      when 0, :head
        node.set_pointer(@head)
        @head = node
      #Insert at tail
      when (@size - 1), :tail
        @tail.set_pointer(node)
        @tail = node
      else
        ith_minus_node = find_node(position)
        node.set_pointer(ith_minus_node.pointer)
        ith_minus_node.set_pointer(node)
      end
      @size += 1
    end

    def reverse_list
      current = @head
      nxt = current.pointer
      current.set_pointer(nil)
      @last = current
      until nxt.nil?
        prv = current
        current = nxt
        nxt = nxt.pointer
        current.set_pointer(prv)
      end
      @head = current
    end

    def find_node(idx)
      i = 0
      #Iteratively search for position in list.
      node_output = @head
      while i < idx - 1
        node_output = node_output.pointer
        i += 1
      end
      node_output
    end

    def find_key(key)
      i = 0
      #Iteratively search for position in list.
      node_output = @head
      while i < @size
        if node_output.data == key
          puts "It took #{i} #{i > 1 ? 'steps' : 'step'} to find this key"
          return node_output
        end
        node_output = node_output.pointer
        i += 1
      end
      nil
    end

    def render_list
      node = @head
      idx = 0
      while node
        puts "--NODE##{idx}--"
        puts "Data: #{node.data}"
        puts "Pointer: #{node.pointer}"
        idx += 1
        node = node.pointer
      end
    end
  end

  class HashTable
    attr_reader :slots
    def initialize
      @slots = Array.new(13,nil)
    end

    def hash(data)
      data[0].downcase.ord - 97
    end

    def insert(key)
      hashed = hash(key)
      return @slots[hashed] = LinkedList.new(Node.new(key)) unless @slots[hashed]
      @slots[hashed].insert(key,:tail)
    end

    def render_slots
      @slots.each_with_index do |slot, index|
        if slot
          puts "Node(#{index}) count: #{slot.size}"
          puts slot.render_list
        end
      end
    end

    def define(word)
      slot_location = hash(word)
      definition = @slots[slot_location].find_key(word)
      definition.nil? ? friendly_msg( word ) : define_msg( word, definition )
    end

    def define_msg( word, definition )
      puts "#{word.capitalize}: The definition of '#{definition.data}' is '#{definition.data}'\n\n"
    end

    def friendly_msg(word)
      puts "Sorry, couldn't find the definition of #{word}...\n"
      puts
    end

    private

      #
      # Load Factor = number_of_occupied_slots / array_size
      # Load Factor == 1/2 --> @slots = get_new_array

      # def get_new_array
      #   i = @slots.size
      #   for i = @slots.size; i != is_prime?(i); i++
      #   new_array Array.new(i,nil)
      #   @slots --> new_array
      #   If array.size == 15 => 0, 2, 7, 15, 100
      # end
      # get_prime
      # To determine the size of the new array, had to find the next size
      # that was also a prime number.
      #
      # is_prime?

      def array_resize
        current_size = @slots.size
        new_array = Array.new(get_next_prime(current_size),nil)
        # @slots.each do |
        # # new_slots.keys --> new keys
        # # new_slots.populate --> old data in slots
        # end
      end

      def get_next_prime(current_size)
        i = current_size + 1
        i += 1 until i.prime?
        i
      end

  end
end


# include DataStructuresAssignment
#
# dictionary = File.readlines("5desk.txt").map(&:strip)
#
# hashtable = HashTable.new
#
# dictionary.each { |word| hashtable.insert(word) }
# binding.pry
# hashtable.define("ha")
# puts dictionary[40000..41000].all? { |word| hashtable.define(word) }


###### BIG O NOTATION ######

# Search in a slot O(n)
# Insert in a single list first? Ordered?

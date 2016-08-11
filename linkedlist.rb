Node = Struct.new( :data, :next)

class LinkedList

	attr_accessor :head, :last

	def initialize( first_node = nil )

		@head = first_node
		@last = first_node

	end

	def add_first_node( data )

		@head = Node.new( data, nil )
		@last = @head

	end



	def add_node( data )

		if @head.nil?

			add_first_node( data  )

		else

			new_node = Node.new( data )

			@last.next = new_node

			@last = new_node

		end

		puts "Added node with value: #{data}"

	end

 # Big O is O(n) since the size of the linked list determines length to traverse the nodes
	def find_node( index )


		count = 0
		current_node = @head
		last_node = nil

		while count < index


		raise "No node at index" if current_node.next.nil?

			print_node( current_node, count )

			last_node = current_node
			current_node = current_node.next
			count += 1

		end

		puts "At index #{count}: #{current_node.word}"

		return last_node, count

	end




	def find_word( id )

		puts ""
		puts "FIND Weight"
		puts ""

		count = 0
		current_node = @head

		loop do

			print_node( current_node, count )

			if current_node.id == id

				return current_node.definition

			elsif current_node.next.nil?

				return false

			end

			count += 1
			current_node = current_node.next

		end


	end


	def print_list

		count = 0
		current_node = @head

		loop do


			print "#{current_node.data[0]} "

			return if current_node.next.nil?

			current_node = current_node.next

			count += 1

		end

	end


end



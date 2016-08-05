Node = Struct.new( :word, :definition, :next )

class LinkedList

	attr_accessor :head, :last

	def initialize( first_node = nil )

		@head = first_node
		@last = first_node

	end

	def add_first_node( weight )

		@head = Node.new( weight )
		@last = @head

	end



	def add_node( weight )

		if @head.nil?

			add_first_node( weight )

		else

			new_node = Node.new( weight )

			@last.next = new_node

			@last = new_node

		end

		puts "Added node with value: #{word}: #{definition}"

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




	def find_word( weight )

		puts ""
		puts "FIND WORD"
		puts ""

		count = 0
		current_node = @head

		loop do

			print_node( current_node, count )

			if current_node.word == weight

				return current_node.definition

			elsif current_node.next.nil?

				return false

			end

			count += 1
			current_node = current_node.next

		end


	end





	def print_node( node, index )

		puts "Currently at index #{index}: #{node.word}"

	end





	def print_list

		count = 0
		current_node = @head

		loop do

			print_node( current_node, count )

			return if current_node.next.nil?

			count += 1
			current_node = current_node.next

		end

	end




	# this is O(1) assuming we've already foung the node since we're only moving references
	def insert_node( weight, index )

		count = 0
		current_node = @head
		last_node = nil


		last_node, count = find_node( index )
		current_node = last_node.next

		if last_node.next.nil?

			add_node( weight )

		else

			new_node = Node.new( word, definition )
			new_node.next = current_node
			last_node.next = new_node

			puts "Inserted #{new_node.word} at index: #{count}"

		end

	end


	def remove_node

		return nil if @head.nil?

		node = @head

		@head = @head.next

		return node

	end



	# O(n) - creates new nodes in this method - time will be linear
	def reverse

		return if @head.nil?

		temp = self.remove_node
		temp.next = nil
		@last = temp

		until @head.nil?

			node = self.remove_node
			node.next = temp
			temp = node

		end

		@head = temp

	end


end



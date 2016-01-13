class LinkedList
	def initialize(options={})
		@length = 0
		@head = nil
		@tail = nil
		@nodes = []
	end

	##
	# Big-O time: O(1)
	# The head of the list is stored
	# This allows constant lookup time

	def prepend(node)
		@nodes.push(node)
		if @head
			node.next = @head
			@head = node
		else
			@head = @tail = node
		end
		@length += 1
	end

	##
	# Big-O time: O(1)
	# The tail of the list is stored
	# This allows constant lookup time

	def append(node)
		@nodes.push(node)
		if @tail
			last_node = @tail
			last_node.next = node
			@tail = node
		else
			@head = @tail = node
		end
		@length += 1
	end

	##
	# Big-O time: O(n), Ω(1)
	# The worst case scenario is linear time
	# Assuming the index is somewhere in the middle of the list
	# the lookup requires traversal
	# This means that the time complexity could be anywhere from
	# constant time to linear time

	def insert(node, index)
		if index == 0
			prepend(node)
		elsif index >= @length
			append(node)
		else
			@nodes.push(node)
			prev_node = read(index - 1)
			next_node = prev_node.next
			prev_node.next = node
			node.next = next_node
		end
		@length += 1
	end

	##
	# Big-O time: O(n), Ω(1)
	# This operation has the same time complexity as insertion
	# this is because the read index could be the first or last node
	# The worst case would require a full traversal of the list

	def read(index)
		node = nil
		i = 0
		if @head
			n = @head
			while (n)
				node = n if i == index
				n = n.next
				i += 1
			end
		end
		node
	end

	##
	# Big-O: O(n)
	# Reversal of a linked list that does not store the previous node
	# is an expensive operation
	# This is because the entire list must be traversed
	# storing a reference to each node, then the references
	# must be traversed in reverse to alter the next property
	# While the time complexity here is really O(2n)
	# the constant 2 is omitted leaving O(n)
	# This method alters the nodes in place

	def reverse
		n = @head
		a = Array.new(@length)
		i = 0
		while (n)
			a[i] = n
			n = n.next
			i += 1
		end
		i = @length - 1
		while (i > -1)
			a[i].next = i == 0 ? nil : a[i - 1]
			i -= 1
		end
		@head = a[@length - 1]
		@tail = a[0]
		@length
	end

	def to_s
		str = ''
		n = @head
		i = 0
		while (n)
			str += "(#{i}: #{n})"
			str += '->' if n.next
			n = n.next
			i += 1
		end
		str
	end

	def empty?
		@length == 0
	end
end


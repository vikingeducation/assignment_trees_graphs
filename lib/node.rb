class Node
  attr_accessor :value, :left_child, :right_child#, :parent
  def initialize(value)
    @value = value
    @left_child
    @right_child
    # @parent
  end

  def << value
    if value < self.value
      if self.left_child
        self.left_child << value
      else
        self.left_child = Node.new(value)
      end
    elsif value > self.value
      if self.right_child
        self.right_child << value
      else
        self.right_child = Node.new(value)
      end
    elsif value == self.value
      raise "Duplicate value error"
    end
  end

end

#       8
#  [3,      10]
# 1   6        14

# [8, [3, [1, 6], 10, [14]]]

# array.each do |element|
#   if element.is_a? Integer
#     print element
#   else
#     go down a line and print that
#   end
# end

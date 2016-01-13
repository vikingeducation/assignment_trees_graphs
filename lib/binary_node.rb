class BinaryNode < Struct.new(:value, :left, :right)
  def to_s
    "#{value}#{left}#{right}"
  end
end


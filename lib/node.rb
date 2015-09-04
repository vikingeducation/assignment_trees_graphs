class Node < Struct.new(:name, :id, :weight, :next)
	def to_s
		"#{name}(#{weight})"
	end
end
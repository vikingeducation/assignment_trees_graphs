info = Struct.new(:name, :id, :weight, :relationships)
class Info
  def initialize
    @relationships = Array.new(20)
header = [info("Bob", 0), info("Harry", 1), info("Alice", 2)]
# Harry = [nil, nil, nil, nil, nil, nil, nil, nil, nil, , nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]

class AdjacemcyMatrix
  name = Info.new()

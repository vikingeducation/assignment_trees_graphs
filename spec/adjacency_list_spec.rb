require "edge_list"
require "adjacency_list"

describe AdjacencyList do
  let(:el){ [[Person.new(0 ,'Harry'), Person.new(1 ,'Alice'), 2]] }
  let(:al) do
    [ [[1, 2]],
      [] ]
  end
  let(:pop_al){ AdjacencyList.new(EDGE_LIST) }

  describe "#initialize" do
    it "creates an AdjacencyList from an edge list" do
      expect(pop_al.is_a? AdjacencyList).to be(true)
    end
  end

  describe ".from_edge_list" do
    it "converts from an edge list" do
      result = AdjacencyList.from_edge_list(el, 2)
      expect(result).to eq(al)
    end

    it "works" do
      up = AdjacencyList.unique_points(EDGE_LIST){|i| i.is_a? Person}
      result = AdjacencyList.from_edge_list(EDGE_LIST, up.count)
      expect(result[0]).to eq([])
      expect(result[1].include?([0, 9])).to be(true)
      expect(result[7].include?([19, 13])).to be(true)
    end
  end

  describe "#edge_weight" do
    it "returns the edge weight given the 'from' and 'to'" do
      expect(pop_al.edge_weight(1, 10)).to eq(2)
    end
  end

end

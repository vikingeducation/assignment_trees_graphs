require "edge_list"
require "adjacency_matrix"

describe "AdjacencyMatrix" do
  let(:el){ [[Person.new(0 ,'Harry'), Person.new(1 ,'Alice'), 2]] }
  let(:am){
    [[nil, 2],
     [nil, nil]]
  }

  describe "#initialize" do
    it "turns the edge list into an adjacency matrix" do
      expect(AdjacencyMatrix.new(el).am).to eq(am)
    end

    it "also stores the unique_points" do
      unique_points = Set.new(el[0].select{ |i| i.is_a? Person} )
      expect(AdjacencyMatrix.new(el).unique_points).to eq(unique_points)
    end
  end

  describe ".unique_points" do
    it "returns an array with the unique points in the edge list" do
      unique_points = Set.new(el[0].select{ |i| i.is_a? Person} )
      result = AdjacencyMatrix.unique_points(el){ |i| i.is_a? Person }
      expect(result).to eq(unique_points)
    end
  end

  describe ".from_edge_list" do
    it "converts an edge list into an adjacency matrix" do
      adjacency_matrix = AdjacencyMatrix.from_edge_list(el, 2)
      expect(adjacency_matrix).to eq(am)
    end

    it "works" do
      up = AdjacencyMatrix.unique_points(EDGE_LIST){|i| i.is_a? Person}
      adjacency_matrix = AdjacencyMatrix.from_edge_list(EDGE_LIST, up.count)
      expect(adjacency_matrix[1][0]).to eq(9)
      expect(adjacency_matrix[1][4]).to eq(11)
      expect(adjacency_matrix[1][10]).to eq(2)
    end
  end

end

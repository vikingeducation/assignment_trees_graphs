describe AdjMatrix do

  let(:adj_matrix) { AdjMatrix.new(EDGE_LIST)}


  describe "#count_people" do
    it "returns the number of people (19)" do
      expect(adj_matrix.count_people(EDGE_LIST)).to eq(20)
    end
  end

  describe "#build" do
    it "returns a matrix of 19 x 19" do
      expect(adj_matrix.length).to eq(20)
    end
  end

  describe "#look_up_table" do
    it "orders people by ID" do
      expect(adj_matrix.look_up_table[14]).to eq("Mike")
    end
  end

end

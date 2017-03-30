srequire "adjacency_matrix"


describe AdjacencyMatrix do 

  let(:am){ AdjacencyMatrix.new(EDGE_LIST) }

  describe "#initialize" do 
    it "saves an array to the instance variable adj_matrix" do 
      expect(am.adj_matrix).to be_a(Array)
    end

    it "creates a 2 dimensional array equal to the number of idsof the edge list" do 
      expect(am.adj_matrix.length).to eq(20)   
    end

    it "sets the value of row 1, column 10 to 2" do 
      expect(am.adj_matrix[1][10]).to eq(2)
    end

    it "sets the value of row 15, column 17 to 8" do 
      expect(am.adj_matrix[15][17]).to eq(8)
    end
  end

  describe "#edge_weight" do 
    it "returns the weight for a given from_id and to_id" do 
      expect(am.edge_weight(1, 10)).to eq(2)   
    end

    it "raises an argument error if an argument is negative" do 
      expect{ am.edge_weight(30, -1) }.to raise_error(ArgumentError)
    end

    it "raises an argument error if an argument is greater than 20" do 
      expect{ am.edge_weight(30, 10) }.to raise_error(ArgumentError)      
    end
  end
end
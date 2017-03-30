require "adjacency_list"

describe AdjacencyList do 

  let(:al){ AdjacencyList.new(EDGE_LIST) }

  describe "#initialize"  do 
    it "sets the instance variable @adj_list to an array" do 
      expect(al.adj_list).to be_a(Array)
    end

    it "creates an array that contains 20 elements" do 
      expect(al.adj_list.length).to eq(20)
    end

    it "creates an array that contains all structs" do 
      expect(al.adj_list.all? { |struct| struct.is_a?(Struct) }).to be true
    end

    it "crreates an array with all structs' next attribute set to nil" do 
      expect(al.adj_list.all? { |struct| struct.next.nil? }).to be true      
    end

    it "removes nils from each row in the adjacency matrix" do 
      expect(al.clean_matrix[0].length).to eq(0)
    end

    it "returns 4 for the length of the 2nd row" do 
      expect(al.clean_matrix[1].length).to eq(4)
    end

  end

  describe "#add_nodes" do 
    before do 
      al.add_nodes     
    end

    it "links the nodes in the clean_matrix to the appropriate node in the adj_list" do 
      expect(al.adj_list[1].next.next.next.name).to eq("Alice")
    end

    it "doesn't set the next node of the first row to another node" do 
      expect(al.adj_list[0].next).to be_nil
    end
  end

  describe "#get_all_links" do 
    before do 
      al.add_nodes
    end

    it "returns an array with a length of 4 for id 1" do 
      expect(al.get_all_links(al.adj_list[1]).length).to eq(5)
    end
  end

  describe "#edge_weight" do 
    before do 
      al.add_nodes
    end

    it "returns 2 if 1 and 10 are passed in as arguments" do 
      expect(al.edge_weight(1, 10)).to eq(2)
    end

    it "returns nil if 0 is passed in as the first argument" do 
      expect(al.edge_weight(0, 1)).to be_nil
    end

    it "returns 9 if 8 and 7 are passed in" do 
      expect(al.edge_weight(8, 7)).to eq(9)
    end
  end

end






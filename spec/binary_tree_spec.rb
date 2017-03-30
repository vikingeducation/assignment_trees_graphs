require "binary_tree"

describe Tree do 

  let(:t){ Tree.new([8, 10, 3, 1, 6, 14, 4, 7, 13]) }

  describe "#initialize" do 
    it "sets the root node's data as 8" do 
      expect(t.root_node.data).to eq(8)
    end

    it "sets the left value of the root node as nil" do 
      expect(t.root_node.left).to eq(nil)
    end

    it "sets the right value of the root node as nil" do 
      expect(t.root_node.right).to eq(nil)
    end

    it "sets @array to the array passed into the initialize argument" do 
      expect(t.array).to eq([10, 3, 1, 6, 14, 4, 7, 13])
    end
  end

  describe "#create_tree" do 
    before do 
      t.create_tree    
    end

    it "sets the right value of the root node to 10" do 
      expect(t.root_node.right.data).to eq(10)
    end

    it "sets the left value of the root node to 3" do 
      expect(t.root_node.left.data).to eq(3)
    end

    it "sets the 2nd child left to 1" do 
      expect(t.root_node.left.left.data).to eq(1)
    end

    it "sets the 2nd child left, right to 6" do 
      expect(t.root_node.left.right.data).to eq(6)
    end

    it "sets the 3rd child left, right, right to 7" do 
      expect(t.root_node.left.right.right.data).to eq(7)
    end

    it "sets the 2nd child right, right to 14" do 
      expect(t.root_node.right.right.data).to eq(14)
    end
  end

  describe "#find_node" do 
    before do 
      t.create_tree
    end

    it "raises an argument error if value is not a number" do 
      expect{ t.find_node("not a number") }.to raise_error(ArgumentError)
    end

    it "returns the root node if 8 is passed in as argument" do 
      expect(t.find_node(8)).to eq(t.root_node)
    end

    it "returns the node if 1 is passed in" do 
      expect(t.find_node(1).data).to eq(1)
    end

    it "returns nil if number is not found" do 
      expect(t.find_node(-1)).to eq(nil)
    end

    it "returns the node if 14 is passed in" do 
      expect(t.find_node(14).data).to eq(14)
    end

    it "returns the node if 4 is passed in " do 
      expect(t.find_node(4).data).to eq(4)
    end
  end

  describe "#add_node" do 
    before do 
      t.create_tree
    end
    
    it "adds 0 as the left leaf node" do 
      t.add_node(0)
      expect(t.root_node.left.left.left.data).to eq(0)
    end

    it "adds 17 as the right leaf node" do 
      t.add_node(17)
      expect(t.root_node.right.right.right.data).to eq(17)
    end
  end

  describe "#display_tree" do  
    before do 
      t.create_tree
    end

    it "raises an argument error if an array is not passed in" do 
      expect{ t.display_tree(t.root_node.left) }.to raise_error(ArgumentError)
    end
  end

end







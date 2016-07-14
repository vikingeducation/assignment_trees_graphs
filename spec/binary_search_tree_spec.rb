require "binary_search_tree"

describe BinarySearchTree do
  let(:tree){BinarySearchTree.new([8, 10, 3, 1, 6, 14,
                                            4, 7, 13])}
  describe "#build_node" do
    it "returns a node object" do
      expect(tree.build_node(1)).to be_a(Node)
    end

    it "sets the data of the node object to the integer passed" do
      expect(tree.build_node(10).data).to eq(10)
    end
  end

  describe "#add_node" do
    it "returns a node object with data set" do
      expect(tree.add_node(10).data).to eq(10)
    end

    it "it updates left pointer" do
      tree.add_node(7)
      expect(tree.root.left.data).to eq(7)
    end

    it "it updates right pointer" do
      tree.add_node(11)
      expect(tree.root.right.data).to eq(11)
    end
  end
end

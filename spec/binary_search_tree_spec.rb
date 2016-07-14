require "binary_search_tree"

describe BinarySearchTree do
  let(:tree){BinarySearchTree.new([8])}
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

    it "it successfully updates child pointers" do
      tree.add_node(11)
      tree.add_node(12)
      expect(tree.root.right.right.data).to eq(12)
    end
  end

  describe "#build_tree" do 
    it "builds the tree" do 
      tree.build_tree([10, 3, 1, 6, 14, 4, 7, 13])
      expect(tree.root.right.data).to eq(10)
      expect(tree.root.right.right.data).to eq(14)
      expect(tree.root.left.data).to eq(3)
      expect(tree.root.left.left.data).to eq(1)
      expect(tree.root.left.right.data).to eq(6)
    end
  end

  describe "#recursive_tree_build" do 
    it "builds the tree recursively" do 
      tree.recursive_build_tree([10, 3, 1, 6, 14, 4, 7, 13])
      # expect(tree.root.right.data).to eq(10)
      expect(tree.root.right.right.data).to eq(14)
      expect(tree.root.left.data).to eq(3)
      expect(tree.root.left.left.data).to eq(1)
      expect(tree.root.left.right.data).to eq(6)
    end

  end 
end

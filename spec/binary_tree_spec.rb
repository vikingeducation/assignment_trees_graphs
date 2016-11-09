require 'rspec'
require 'binary_tree'

describe BinaryTree do
  let(:tree) {BinaryTree.new([5,7,6,2,9,8])}

  describe "#new" do
    it "takes an array" do
      expect{tree}.not_to raise_error
    end
  end

  describe "#build" do
    it "sets the first element to be the tree root" do
      expect(tree.root.num).to eq(5)
    end
    it "elements larger than the root array place in the right branch" do
      expect(tree.root.right.num).to eq(7)
    end
  end

  describe "#"

end

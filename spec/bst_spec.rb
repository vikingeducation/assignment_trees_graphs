require "bst"

describe BST do
  let(:bst){ BST.new }
  let(:data){ [8, 10, 3, 1, 6, 14, 4, 7, 13] }

  describe "#initialize" do
    it "can initialize without any value" do
      expect(BST.new.is_a? BST).to be(true)
    end

    it "can receive an array to create the nodes" do
      expect(BST.new(data).is_a? BST).to be(true)
    end
  end

  describe "#build_tree" do
    it "returns the first value as the root node" do
      result = bst.build_tree(data)
      expect(result.data).to eq(data[0])
    end

    it "populates the left node if the value is lower and left is nil" do
      result = bst.build_tree([2, 1])
      expect(result.left.data).to eq(1)
    end

    it "populates the left node if it is already populated" do
      result = bst.build_tree([2, 1, 0])
      expect(result.left.left.data).to eq(0)
    end

    it "populates the right node if its higher and right is nil" do
      result = bst.build_tree([1, 2])
      expect(result.right.data).to eq(2)
    end

    it "populates the right node if it already populated" do
      result = bst.build_tree([1, 2, 3])
      expect(result.right.right.data).to eq(3)
    end
  end

  describe "#traverse" do
    it "return the data of the nodes" do
      tr = BST.new(data)
      expect(tr.traverse).to eq(data.sort)
    end
  end

end

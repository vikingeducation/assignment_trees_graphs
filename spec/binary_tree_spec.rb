require 'binary_tree'
require 'rspec'

describe BinaryTree do

  let(:bonsai){ BinaryTree.new([8, 10, 3])}
  let(:error_prune_tree){ BinaryTree.new([8, 10, 3, 8]) }
  let(:hearty_oak){ BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13]) }

  describe '#new' do
    it "turns an array into a binary tree" do
      expect(bonsai.root.value).to eq(8)
      expect(bonsai.root.left_child.value).to eq(3)
      expect(bonsai.root.right_child.value).to eq(10)
    end
    it "throws an error when a duplicate value is found" do
      expect{error_prune_tree}.to raise_error("Duplicate value error")
    end
  end

end

require 'binary_tree'
require 'rspec'

describe Node do
  let(:husk) { Node.new }
  let(:seed) { Node.new(4) }
  describe '#new' do
    it 'instantiates a node' do
      expect(seed.value).to eq(4)
    end
    it 'throws an error when instantiated without a value' do
      expect { husk }.to raise_error(ArgumentError)
    end
  end
  describe '<<' do
    it 'adds a child' do
      seed << 3
      expect(seed.left_child.value).to eq(3)
    end
  end
end

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

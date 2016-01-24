require 'binary_trees'

describe BinaryTree do

  let(:bt){BinaryTree.new([8,10,3,1,6,14,4,7,13])}

  it "is an instance of BinaryTree" do
    expect(BinaryTree.new([])).to be_a(BinaryTree)
  end

  describe '#initialize' do
    it 'returns an error if an argument is not given' do
      expect{BinaryTree.new}.to raise_error
    end
  end

=begin
  [8, 10, 3, 1, 6, 14, 4, 7, 13]


                  8
                /   \
               3     10
              / \      \
             1   6      14
                / \    /
               4   7  13
=end

  describe '#build_tree / #new_node' do
    it 'puts the value in the correct places' do
      expect(bt.root_node.left.left.number).to eq(1)
    end

    it 'puts the value in the correct places' do
      expect(bt.root_node.right.right.left.number).to eq(13)
    end

    it 'puts the value in the correct places' do
      expect(bt.root_node.left.right.left.number).to eq(4)
    end

    it "doesn't have a node where there shouldn't be a node" do
      expect(bt.root_node.left.left.left).to eq(nil)
    end
  end

  describe '#output_item_and_position' do
    # Not really returning anything so not too sure how necessary this is
  end

end
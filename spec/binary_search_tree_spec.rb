describe BinaryTree do
  let(:tree) { BinaryTree.new([1,2,3])}

  describe '#add_node' do
    it "sets the value to the root node if there is no root node" do
      expect(tree.root.value).to eq(1)
    end

    it "sets the left child to a value less than current_node.value" do
      
    end
  end
end

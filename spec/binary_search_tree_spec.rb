describe BinaryTree do
  let(:tree) { BinaryTree.new([2,1,3])}

  describe '#add_node' do
    it "sets the value to the root node if there is no root node" do
      expect(tree.root.value).to eq(2)
    end

    it "sets the left child to a value less than current_node.value" do
      expect(tree.root.value).to be > tree.root.left.value
    end

    it "sets the right child to a value greater than current_node.value" do
      expect(tree.root.value).to be < tree.root.right.value
    end
  end

  describe '#inspect' do
    it "should print all values" do
      expect($stdout).to receive(:puts).with(2)   
      expect($stdout).to receive(:puts).with(1)
      expect($stdout).to receive(:puts).with(3)
      tree.inspect
    end
  end
end

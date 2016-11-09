require 'binary_tree'
require 'rspec'

describe BinaryTree do
  let(:bonsai){ BinaryTree.new([8, 10, 3])}
  let(:error_prune_tree){ BinaryTree.new([8, 10, 3, 8]) }
  let(:hearty_oak){ BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13]) }
  describe '#new' do
    it "turns an array into a binary tree" do

    end
  end

end

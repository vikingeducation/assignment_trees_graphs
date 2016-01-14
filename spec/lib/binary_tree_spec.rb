require 'spec_helper'
require 'binary_tree'

describe BinaryTree do
  let(:binary_tree) { BinaryTree.new(8, 10, 3, 1, 6, 14, 4, 7, 13) }
  let(:small_tree) { BinaryTree.new(2, 1, 4, 3) }

  describe '#initialize' do
    it 'accepts an array of values as a parameter' do
      expect { binary_tree }.to_not raise_error
    end


    it 'results in a tree being built from the parameters' do
      expect(small_tree.root.value).to eq(2)
      expect(small_tree.root.left.value).to eq(1)
      expect(small_tree.root.right.value).to eq(4)
      expect(small_tree.root.right.left.value).to eq(3)
    end
  end
end


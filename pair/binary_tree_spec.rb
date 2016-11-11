require 'rspec'
require 'binary_tree'

describe BinaryTree do
  let(:tree) {BinaryTree.new([5,7,6,2,9,8])}
  describe "#new" do
    expect{tree}.not_to raise_error
  end
end
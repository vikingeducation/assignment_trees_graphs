
require 'binary_tree'

describe BinaryTree do
  let(:binary_tree) { BinaryTree.new }

  describe '#crawl' do
    it 'returns the terminal node for a given number' do
      binary_tree.add_node(8)
      binary_tree.add_node(4)
      binary_tree.add_node(9)
      expect(binary_tree.crawl(7).number).to eq(4)
    end
  end

  describe '#generate_tree' do
    it 'creates a tree from a set of data' do
      data_set = [8, 10, 3, 1, 6, 14, 4, 7, 13]
      binary_tree.generate_tree(data_set)
      expect(binary_tree.crawl(4).number).to eq(4)
    end
  end
end

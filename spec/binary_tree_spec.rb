Node = Struct.new(:data, :left, :right)
class BinaryTree
  attr_reader :root

  def initialize(data)
    @root = Node.new(data.first)

    set_tree(data)
  end

  private

  def set_tree(data)
    data[1..-1].each do |value|
      new_node = Node.new(value)
      current_node = @root

      loop do
        if value < current_node.data
          if current_node.left.nil?
            current_node.left = new_node
            break
          else
            current_node = current_node.left
          end
        end

        if value > current_node.data
          if current_node.right.nil?
            current_node.right = new_node
            break
          else
            current_node = current_node.right
          end
        end
      end
    end
  end
end

RSpec.describe BinaryTree do
  let(:full_data_set) { [8, 10, 3, 1, 6, 14, 4, 7, 13] }

  it 'sets the first value to the root node' do
    b_tree = BinaryTree.new(full_data_set)
    expect(b_tree.root).to be_a_kind_of Node
    expect(b_tree.root.data).to eq 8
  end

  context 'root value set' do
    let(:data_subset) { full_data_set[0..2] }
    let(:b_tree) { BinaryTree.new(data_subset) }

    it 'sets the larger value as the "right child" of the root' do
      expect(b_tree.root.right.data).to eq 10
    end

    it 'sets lesser value as the "left child" of the root' do
      expect(b_tree.root.left.data).to eq 3
    end
  end

  describe 'root has left child set' do
    context 'value is less than root' do
      context 'value is less than left child' do
        let(:subset) { full_data_set[0..3] }

        it 'sets new value to left child of root left child' do
          bt = BinaryTree.new(subset)
          expect(bt.root.left.left.data).to eq 1
        end
      end
    end


    context 'value is greater than left child' do
      let(:subset) { full_data_set[0..4] }

      it 'sets new value to right child of root left child' do
        bt = BinaryTree.new(subset)
        expect(bt.root.left.right.data).to eq 6
      end
    end
  end

  describe 'root has right child set' do
    context 'value is greater than root' do
      context 'value is greater than right child' do
        let(:subset) { full_data_set[0..5] }

        it 'sets new value to right child of root right child' do
          bt = BinaryTree.new(subset)
          expect(bt.root.right.right.data).to eq 14
        end
      end
    end


    context 'value is less than right child' do
      it 'sets new value to left child of root right child' do
        bt = BinaryTree.new(full_data_set)
        expect(bt.root.right.right.left.data).to eq 13
      end
    end
  end
end
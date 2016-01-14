require 'spec_helper'
require 'edge_list'
require 'support/edge_list'
require 'adjacency_matrix'

describe AdjacencyMatrix do
	let(:e){EdgeList.new(5)}
	let(:m){AdjacencyMatrix.new(e)}

	before do
    allow(e).to receive(:list).and_return(Support::EdgeList::LIST)
	end

	describe '#initialize' do
		it 'takes an EdgeList as a parameter' do
			expect {m}.to_not raise_error
		end
	end

	describe '#edge_list' do
		it 'is an accessor' do
			expect {m.edge_list}.to_not raise_error
		end
	end

	describe '#print_matrix' do
		it 'returns a string' do
			expect(m.print_matrix).to be_kind_of(String)
		end
	end

	describe '#edge_weight' do
		it 'takes 2 IDs as parameters' do
			expect {m.edge_weight(0, 0)}.to_not raise_error
		end

		it 'outputs the weight for the given edge' do
			expect(m.edge_weight(0, 0)).to eq(m.matrix[0][0])
		end
	end
end
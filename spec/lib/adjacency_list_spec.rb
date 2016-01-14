require 'spec_helper'
require 'edge_list'
require 'support/edge_list'
require 'adjacency_list'

describe AdjacencyList do
	let(:e){EdgeList.new(5)}
	let(:l){AdjacencyList.new(e)}

	before do
		allow(e).to receive(:list).and_return(Support::EdgeList::LIST)
	end

	describe '#initialize' do
		it 'takes an EdgeList as a parameter' do
			expect {l}.to_not raise_error
		end
	end

	describe '#edge_list' do
		it 'is an accessor' do
			expect {l.edge_list}.to_not raise_error
		end
	end

	describe '#print_adj_list' do
		it 'returns a string' do
			expect(l.to_s).to be_kind_of(String)
		end
	end

	describe '#edge_weight' do
		it 'takes 2 IDs as parameters' do
			expect {l.edge_weight(0, 0)}.to_not raise_error
		end

		it 'returns a weight for the given edge' do
			expect(l.edge_weight(0, 1)).to eq(9)
		end
	end
end
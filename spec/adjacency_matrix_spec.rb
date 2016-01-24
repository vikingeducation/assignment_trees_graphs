require 'adjacency_matrix'

describe AdjacencyMatrix do

  let(:el){EdgeList.new(2,10).list}
  let(:am){AdjacencyMatrix.new(el)}

  describe '#initialize' do
    it 'raises an error when no argument is given' do
      expect{AdjacencyMatrix.new}.to raise_error
    end

    it 'does not raise an error when an edge list is given' do
      expect{am}.to_not raise_error
    end

    it 'returns Fixnum as the class of the @edge_list[0][2]' do
      expect(am.edge_list[0][2].class).to eq(Fixnum)
    end
  end

  describe '#edge_list_to_adjacency_matrix' do

    it 'returns an array' do
      expect(am.edge_list_to_adjacency_matrix).to be_a(Array)
    end

    it 'returns an array with size of 20' do
      expect(am.edge_list_to_adjacency_matrix.size).to eq(20)
    end

    it 'returns a string (name) when array and sub-array indexes are the same eg adjacenecy_matrix[0][0]' do
      expect(am.edge_list_to_adjacency_matrix[0][0]).to be_a(String)
    end

  end

  describe '#print_matrix' do
    it 'returns nil' do
      expect(am.print_matrix).to eq(nil)
    end
  end
end
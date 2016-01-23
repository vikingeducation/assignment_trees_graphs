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
    # I need it to take an argument
    it 'raises an error when no argument is given' do
      expect{am.edge_list_to_adjacency_matrix}.to raise_error
    end

    it 'does not raise an error when an edge list is given' do
      expect{am.edge_list_to_adjacency_matrix(el)}.to_not raise_error
    end

  end
end
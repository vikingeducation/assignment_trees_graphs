require_relative '../edge_list'

class AdjacencyMatrix
  def initialize(edge_list)
    @ltable = create_lookup_table(edge_list)
  end

  def lookup_table(id)
    @ltable[id]
  end

  private

  def create_lookup_table(list)
    list.each_with_object({}) do |edge, table|
      person = edge[0]

      unless table[person.id]
        table[person.id] = person
      end
    end
  end
end

RSpec.describe AdjacencyMatrix do
  describe 'lookup-table' do
    it 'represents the persons from the edgelist' do
      am = AdjacencyMatrix.new(EDGE_LIST)
      expect(am.lookup_table(1).name).to eq EDGE_LIST[0][0].name
      expect(am.lookup_table(7).name).to eq EDGE_LIST[16][0].name
    end
  end
end
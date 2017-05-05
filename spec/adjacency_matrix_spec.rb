require_relative '../edge_list'

class AdjacencyMatrix
  attr_reader :matrix

  def initialize(edge_list)
    @ltable = create_lookup_table(edge_list)
    @matrix = create_matrix(edge_list)
  end

  def edge_weight(id_from, id_to)
    @matrix[id_from][id_to]
  end

  def print_matrix
    printable_matrix = "\t\t"
    (0...@ltable.length).each do |id|
      printable_matrix += "#{lookup(id).name}\t"
    end
    printable_matrix += "\n"

    @matrix.each_with_index do |row, i|
      printable_matrix += "\t#{lookup(i).name}\t"
      printable_matrix += row
                            .map { |weight| weight.nil? ? 'X' : weight }
                            .join("\t")
      printable_matrix += "\n"
    end

    puts printable_matrix
  end

  private

  def create_lookup_table(list)
    list.each_with_object({}) do |edge, table|
      edge[0..1].each do |person|
        unless table[person.id]
          table[person.id] = person
        end
      end
    end
  end

  def create_matrix(list)
    matrix = Array.new(@ltable.length) { Array.new(@ltable.length) }
    list.each do |edge|
      person_from, person_to, weight = *edge
      matrix[person_from.id][person_to.id] = weight
      matrix[person_to.id][person_from.id] = weight
    end

    matrix
  end

  def lookup(id)
    @ltable[id]
  end
end

RSpec.describe AdjacencyMatrix do
  let(:am) { AdjacencyMatrix.new(EDGE_LIST) }

  describe '#edge_weight' do
    it 'returns the edge weight between to people' do
      expect(am.edge_weight(1, 10)).to eq 2
      expect(am.edge_weight(10, 1)).to eq 2

      expect(am.edge_weight(2, 6)).to be_nil
    end
  end
end
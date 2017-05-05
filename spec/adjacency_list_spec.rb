require_relative '../edge_list'
require_relative '../lib/linked_list'

class AdjacencyList
  attr_reader :list

  def initialize(edge_list)
    @ltable = create_lookup_table(edge_list)
    @list = create_adj_list(edge_list)
  end

  # O(m), where m = number of nodes in the linked list
  def edge_weight(from_id, to_id)
    node = @list[from_id].read_node_at(to_id)
    node.nil? ? nil : node.weight
  end

  def print_adj_list
    p_list = ''
    (0...@list.length).each do |from_id|
      p_list += "#{lookup(from_id).name}\t"
      (0...@ltable.length).each do |to_id|
        weight = edge_weight(from_id, to_id)
        person_to = lookup(to_id).name
        p_list += weight.nil? ? "\t#{person_to}(X), " : "\t#{person_to}(#{weight}), "
      end
      p_list += "\n"
    end


    puts p_list
  end

  private

  def create_adj_list(edge_list)
    adj_list = Array.new(@ltable.length) { LinkedList.new }
    edge_list.each do |edge|
      person_from, person_to, weight = *edge
      adj_list[person_from.id].add_node(person_to.id, weight)
      adj_list[person_to.id].add_node(person_from.id, weight)
    end

    adj_list
  end

  def create_lookup_table(list)
    list.each_with_object({}) do |edge, table|
      edge[0..1].each do |person|
        unless table[person.id]
          table[person.id] = person
        end
      end
    end
  end

  def lookup(id)
    @ltable[id]
  end
end

RSpec.describe AdjacencyList do
  let(:al) { AdjacencyList.new(EDGE_LIST) }

  it 'creates a list from the EDGE_LIST' do
    expect(al.list.first).to be_a_kind_of LinkedList
  end

  describe '#edge_weight' do
    context 'edge exists between two people' do
      it 'returns edge weight between them' do
        expect(al.edge_weight(1, 0)).to eq 9
      end
    end

    context 'edge does not exist between two people' do
      it 'returns nil' do
        expect(al.edge_weight(4, 3)).to be_nil
      end
    end
  end

  describe 'temp: #print_adj_list' do
    it 'prints the list' do
      al.print_adj_list
    end
  end
end

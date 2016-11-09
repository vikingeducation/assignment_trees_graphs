require 'node'
require 'rspec'

describe Node do
  let(:husk) { Node.new }
  let(:seed) { Node.new(4) }
  describe '#new' do
    it 'instantiates a node' do
      expect(seed.value).to eq(4)
    end
    it 'throws an error when instantiated without a value' do
      expect { husk }.to raise_error(ArgumentError)
    end
  end
  describe '<<' do
    it 'adds a child' do
      seed << 3
      expect(seed.left_child.value).to eq(3)
    end
  end
  # describe
end

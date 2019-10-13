require 'van'

describe Van do

  describe 'initialization' do
    subject { Van.new }
    # let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.collect(double :bike)
      end
      expect { subject.collect(double :bike) }.to raise_error 'Van full'
    end
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Van::DEFAULT_CAPACITY
  end

  it { is_expected.to respond_to(:collect).with(1).argument }

  # it 'can collect bikes' do
  #   bike = double(:bike)
  #   expect(subject.collect(bike)).to eq bike
  # end

  describe '#collect' do
    it 'raises an error when full' do
      subject.capacity.times { subject.collect(double :bike) }
      expect { subject.collect(double :bike) }.to raise_error 'Van full'
    end
  end



end

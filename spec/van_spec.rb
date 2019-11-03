require 'van'

describe Van do

  before do
    station = double(:station)
    allow(station).to receive(:release_broken_bike) { double :bike }
  end

  describe 'initialization' do
    subject { Van.new }
    it 'defaults capacity' do
      station = double(:station)
      allow(station).to receive(:release_broken_bike) { double :bike }
      described_class::DEFAULT_CAPACITY.times do
        subject.collect_bike(station)
      end
      expect { subject.collect_bike(station) }.to raise_error 'Van full'
    end
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Van::DEFAULT_CAPACITY
  end

  it { is_expected.to respond_to(:collect_bike).with(1).argument }

  describe '#collect_bike' do
    it 'raises an error when full' do
      station = double(:station)
      allow(station).to receive(:release_broken_bike) { double :bike }
      subject.capacity.times { subject.collect_bike(station) }
      expect { subject.collect_bike(station) }.to raise_error 'Van full'
    end
  end

  it { is_expected.to respond_to(:unload_bike) }

  it 'unloads bikes' do
    bike = double(:bike)
    station = double(:station)
    allow(station).to receive(:release_broken_bike) { bike }
    subject.collect_bike(station)
    expect(subject.unload_bike).to be bike
  end

  describe '#unload_bike' do
    it 'raises an error when the van is empty' do
      expect { subject.unload_bike }.to raise_error 'Van is empty'
    end
  end

end

require 'garage'

describe Garage do

  describe 'initialization' do
    subject { Garage.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.accept(double :bike)
      end
      expect { subject.accept(double :bike) }.to raise_error 'Garage full'
    end
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Garage::DEFAULT_CAPACITY
  end

  it { is_expected.to respond_to(:accept).with(1).argument }

  describe '#accept' do
    it 'raises an error when full' do
      subject.capacity.times { subject.accept(double :bike) }
      expect { subject.accept(double :bike) }.to raise_error 'Garage full'
    end
  end

  it { is_expected.to respond_to(:release_bike) }

  it 'releases bikes' do
    bike = double(:bike, working?: true)
    subject.accept(bike)
    expect(subject.release_bike).to be bike
  end

  describe '#release_bike' do
    it 'raises and error when the garage is empty' do
      expect { subject.release_bike }.to raise_error 'Garage is empty'
    end
  end

  it { is_expected.to respond_to(:repair_bike) }

  # it 'can repair bikes' do
  #   bike = double(:bike, working?: false)
  #   subject.repair_bike
  #   expect(bike.working?).to be_truthy
  # end


end

require 'docking_station'

describe DockingStation do

  describe 'initialization' do
    subject { DockingStation.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(double :bike)
      end
      expect { subject.dock (double :bike) }.to raise_error 'Docking station full'
    end
  end

  it 'releases working bikes' do
    bike = double(:bike, working?: true)
    subject.dock(bike)
    expect(subject.release_bike).to be bike
  end

    it 'does not release broken bikes' do
      bike = double(:bike, working?: false)
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error 'No working bikes available'
    end

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock(double :bike) }
      expect { subject.dock(double :bike) }.to raise_error 'Docking station full'
    end
  end

end

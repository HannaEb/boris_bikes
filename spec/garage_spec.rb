require 'garage'

describe Garage do

  it { is_expected.to respond_to(:accept).with(1).argument }

  it { is_expected.to respond_to(:release_bike) }

  it 'releases bikes' do
    bike = double(:bike)
    subject.accept(bike)
    expect(subject.release_bike).to be bike
  end

end

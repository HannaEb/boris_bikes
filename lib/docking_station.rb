require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :capacity
  attr_accessor :bikes
  #attr_reader :broken_bikes

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def dock(bike)
    fail 'Docking station full' if full?
    bikes << bike
  end

  def release_bike
    fail 'No bikes available' if empty?
    bike = bikes.find { |bike| bike.working? }
    bikes.delete(bike)
    return bike
    raise 'No working bikes available'
  end

  def release_broken_bike
    fail 'No bikes available' if empty?
    bike = bikes.find { |bike| !bike.working? }
    bikes.delete(bike)
    return bike
    raise 'No broken bikes available'
  end

  private

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end

end

require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :capacity
  attr_reader :bikes

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def dock(bike)
    fail 'Docking station full' if full?
    bikes << bike
  end

  def accept_bike(van)
    fail 'Docking station full' if full?
    bikes << van.unload_bike
  end

  def release_bike
    fail 'No working bikes' unless working_bikes.any?
    bike = bikes.find { |bike| bike.working? }
    bikes.delete(bike)
    return bike
  end

  def release_bike_to_collect
    fail 'No broken bikes' unless broken_bikes.any?
    bike = bikes.find { |bike| !bike.working? }
    bikes.delete(bike)
    return bike
  end

  private

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end

  def broken_bikes
    bikes.select { |bike| !bike.working? }
  end

  def working_bikes
    bikes.select { |bike| bike.working? }
  end

end

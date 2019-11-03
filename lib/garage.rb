require_relative 'bike'

class Garage
  DEFAULT_CAPACITY = 50
  attr_reader :capacity
  attr_reader :bikes

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def accept(bike)
    fail "Garage full" if full?
    bikes << bike
  end

  def release_bike
    fail 'Garage is empty' if empty?
    bike = bikes.find { |bike| bike.working? }
    bikes.delete(bike)
    return bikes
    raise 'No working bikes available'
  end

  def repair_bike
    bikes.each { |bike| bike.repair }
  end

  private



  def full?
    bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    bikes.empty?
  end

end

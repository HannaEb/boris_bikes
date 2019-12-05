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
    #needs to accept bikes from van
    fail "Garage full" if full?
    bikes << bike
  end

  def bike_to_collect
    raise 'No working bikes' unless working_bikes.any?
    bike = bikes.find { |bike| bike.working? }
    bikes.delete(bike)
    return bikes
  end

  def repair_bike
    bikes.each { |bike| bike.repair }
  end

  private

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end

  def working_bikes
    bikes.select { |bike| bike.working? }
  end

end

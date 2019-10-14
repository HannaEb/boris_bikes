require_relative 'bike'

class Garage
  DEFAULT_CAPACITY = 50
  attr_reader :capacity

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
    bikes.each { |bike| return bike }
  end

  private

  attr_reader :bikes

  def full?
    bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    bikes.empty?
  end

end

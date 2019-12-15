require_relative 'bike'

class Van
  DEFAULT_CAPACITY = 10
  attr_reader :capacity
  attr_reader :bikes

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def collect_bike(location)
    fail 'Van full' if full?
    bikes << location.release_bike_to_collect
  end

  def unload_bike
    fail 'Van is empty' if empty?
    bike = bikes.first
    bikes.delete(bike)
    return bike
  end

  private

  def full?
    bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    bikes.empty?
  end

end

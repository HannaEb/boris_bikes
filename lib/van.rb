require_relative 'bike'

class Van
  DEFAULT_CAPACITY = 10
  attr_reader :capacity
  attr_reader :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def collect_bike(station)
    fail 'Van full' if full?
    #bikes << bike
    while !full? do
      bikes << station.release_broken_bikes
    end
  end

  def unload_bike
    fail 'Van is empty' if empty?
    bikes.each { |bike| return bike }
  end

  private

  def full?
    bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    bikes.empty?
  end

end

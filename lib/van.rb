require_relative 'bike'

class Van
  DEFAULT_CAPACITY = 10
  attr_reader :capacity
  attr_reader :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def collect_bike(location)
    fail 'Van full' if full?
    while !full?
      bikes << location.bike_to_collect
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

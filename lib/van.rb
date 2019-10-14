require_relative 'bike'

class Van
  DEFAULT_CAPACITY = 10
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def collect(bike)
    fail 'Van full' if full?
    bikes << bike
  end

  def unload
    fail 'Van is empty' if empty?
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

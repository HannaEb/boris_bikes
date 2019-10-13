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
    @bikes << bike
  end

  private

  attr_reader :bikes

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end


end

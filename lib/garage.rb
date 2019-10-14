require_relative 'bike'

class Garage

def initialize
  @bikes = []
end

def accept(bike)
  bikes << bike
end

def release_bike
  bikes.each { |bike| return bike }
end

private

attr_reader :bikes

end

require './lib/docking_station'
require './lib/bike'
require './lib/garage'
require './lib/van'

station = DockingStation.new
garage = Garage.new
van = Van.new
bike1 = Bike.new
bike2 = Bike.new
bike3 = Bike.new
bike2.report_broken
bike3.report_broken
station.dock(bike1)
station.dock(bike2)
station.dock(bike3)
# station.bikes
# van.bikes
# van.collect_bike(station)
# van.bikes
# station.bikes

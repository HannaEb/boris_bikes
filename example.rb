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
bike4 = Bike.new
bike5 = Bike.new
bike6 = Bike.new
bike7 = Bike.new
bike8 = Bike.new
bike9 = Bike.new
bike10 = Bike.new
bike11 = Bike.new
bike12 = Bike.new
bike2.report_broken
bike3.report_broken
station.dock(bike1)
station.dock(bike2)
station.dock(bike3)
station.dock(bike4)
station.dock(bike5)
station.dock(bike6)
station.dock(bike7)
station.dock(bike8)
station.dock(bike9)
station.dock(bike10)
station.dock(bike11)
station.dock(bike12)
#p station.bikes
#p van.bikes
van.collect_bike(station)
p van.bikes
p station.bikes
# van.bikes
# station.bikes

require_relative 'docking_station'

class Bike

  def working?
    !@broken
  end

  def report_broken
    @broken = true
  end

end

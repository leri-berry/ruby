require_relative 'instance_counter'

class Route
  attr_reader :stations

  include InstanceCounter

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
    register_instance
  end

  def add_stations(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end

  def see_all_route
    @stations.each { |station| puts station.name}
  end

end
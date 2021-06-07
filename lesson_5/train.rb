require_relative 'company_name'
require_relative 'instance_counter'

class Train
  attr_reader :speed, :type, :name, :number, :current_station, :carriages

  include CompanyName
  include InstanceCounter

  @@instances = []

  def self.find(number)
    @@instances.each do |instance|
      if instance.number == number
        return instance
      else
        puts 'Train was not found'
      end
    end
  end


  def initialize(name, number, type)
    @name = name
    @number = number
    @type = type
    @carriages = []
    @@instances << self
    register_instance
  end


  def set_speed(speed)
    @speed = speed
  end

  def current_speed
    @speed
  end

  def stop
    @speed = 0
  end

  def add_carriage(carriage)
    @carriages << carriage
  end

  def remove_carriage(carriage)
    @carriages.delete(carriage)
  end

  def set_route(route)
    @route = route
    @current_station = route.stations[0]
    @current_station.get_trains(self)
  end

  def next_station
    return unless @current_station != @route.stations[-1]
    @route.stations[@route.stations.index(@current_station) + 1]
  end

  def previous_station
    return unless @current_station != @route.stations[0]
    @route.stations[@route.stations.index(@current_station) - 1]
  end

  def moving_next_station
    if next_station
      current_station.send_train(self)
      next_station.get_trains(self)
      @current_station = next_station
    end
  end

  def moving_previous_station
    if previous_station
      current_station.send_train(self)
      previous_station.get_trains(self)
      @current_station = previous_station
    end
  end
end

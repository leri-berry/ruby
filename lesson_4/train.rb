class Train
  attr_reader :speed, :type, :name, :current_station, :carriages

  def initialize(name, type)
    @name = name
    @type = type
    @carriages = []
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

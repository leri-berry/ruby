class Train
  attr_reader :speed, :type, :number_of_carriages

  def initialize(number, type, number_of_carriages)
    @number = number
    @type = type
    @number_of_carriages = number_of_carriages
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

  def add_carriage
    if @speed == 0
    @number_of_carriages += 1
  else
    puts 'Stop the train'
  end
end

  def remove_carriage
    if @speed == 0
    @number_of_carriages -= 1
  else
    puts 'Stop the train'
  end
end

  def set_route(route)
    @route = route
    @current_station = route.stations[0]
    @current_station.get_trains(self)
  end

  def current_station
    @current_station
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

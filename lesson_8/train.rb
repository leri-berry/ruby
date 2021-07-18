# frozen_string_literal: true

require_relative 'company_name'
require_relative 'instance_counter'
require_relative 'validator'

class Train
  attr_reader :speed, :type, :name, :number, :current_station, :carriages

  include CompanyName
  include InstanceCounter
  include Validator

  @@instances = []

  FORMAT_NUMBER = /^[0-9a-z]{3}-?[0-9a-z]{2}$/i.freeze

  def self.find(number)
    @@instances.each do |instance|
      return instance if instance.number == number
    end
  end

  def initialize(name, number, type)
    @name = name
    @number = number
    @type = type
    @carriages = []
    @@instances << self
    register_instance
    validate!
  end

  def gain_speed(speed)
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

  def take_route(route)
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
    return if next_station

    current_station.send_train(self)
    next_station.get_trains(self)
    @current_station = next_station
  end

  def moving_previous_station
    return if previous_station

    current_station.send_train(self)
    previous_station.get_trains(self)
    @current_station = previous_station
  end

  def list_carriages
    block = lambda do |carriage|
      if carriage.type == 'cargo'
        puts "#{carriage.occupied_volume}, #{carriages.free_volume}"
      else
        puts "#{carriage.occupied_seats}, #{carriage.free_seats}"
      end
    end
    @carriages.each { |carriage| block.call(carriage) }
  end

  protected

  def validate!
    raise 'Number has invalid format' if number !~ FORMAT_NUMBER
    raise 'Type can not be nil' if type.empty?
  end
end
